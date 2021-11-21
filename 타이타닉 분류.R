titanic_train=read.csv("C:\\Users\\Cho\\Desktop\\단국\\2학년 2학기\\데이터사이언스\\데이터사이언스_과제4자료\\train.csv")
titanic_test=read.csv("C:\\Users\\Cho\\Desktop\\단국\\2학년 2학기\\데이터사이언스\\데이터사이언스_과제4자료\\test.csv")

#Data Preprocessing
titanic_test$Survived <- c(NA)
titanic_raw <- rbind(titanic_train, titanic_test)

##1.Pclass
titanic_raw$Pclass <- as.factor(titanic_raw$Pclass)
qplot(Survived, data = titanic_raw, fill = Pclass)

##2.Sex
qplot(Survived, data = titanic_raw, fill = Sex)

##3.Sibsp, Parch
titanic_raw$family <- titanic_raw$SibSp + titanic_raw$Parch
titanic_raw$family <- ifelse(titanic_raw$family == 0, 0, 1)
qplot(Survived, data = titanic_raw, fill = as.factor(family))

##4.Fare
boxplot(titanic_raw$Fare)$stats
titanic_raw$Fare_group <- titanic_raw$Fare%/%10
titanic_raw$Fare_group <- ifelse(titanic_raw$Fare_group > 10, 10, titanic_raw$Fare_group)
titanic_raw$Fare_group <- as.factor(titanic_raw$Fare_group)
qplot(Survived, data = titanic_raw, fill = Fare_group)

##5.Embarked
titanic_raw$Embarked <- ifelse(titanic_raw$Embarked == "", "4", titanic_raw$Embarked)
titanic_raw$Embarked <- as.factor(titanic_raw$Embarked)
qplot(Survived, data = titanic_raw, fill = Embarked)


##
raw <- dplyr::select(titanic_raw, -Name, -SibSp, -Parch, -Ticket, -Cabin)

##6.Age
qplot(Age, data = titanic_raw)
boxplot(titanic_raw$Age)$stats
Age_NA <- is.na(raw$Age)
raw_na <- filter(raw, Age_NA)
raw_not_na <- filter(raw, !Age_NA)

check <- c()
for(i in (1:263)){ # train:177 test:86
  for(j in (1:1046)){ # train:714 test:332
    if ((raw_na$Pclass[i] == raw_not_na$Pclass[j])
        & (raw_na$Sex[i] == raw_not_na$Sex[j])
        & (raw_na$Embarked[i] == raw_not_na$Embarked[j])
        & (raw_na$family[i] == raw_not_na$family[j])
        & (raw_na$Fare_group[i] == raw_not_na$Fare_group[j])){
      check <- c(check, j)
      break
    }
    else{
      if(j==1046) check <- c(check, 0)
    }
  }
}
raw_na$has_same <- check
check2 <- c()
for(i in (1:263)){
  for(j in (1:1046)){
    if ((raw_na$Pclass[i] == raw_not_na$Pclass[j])
        & (raw_na$Sex[i] == raw_not_na$Sex[j])
        & (raw_na$Embarked[i] == raw_not_na$Embarked[j])
        & (raw_na$family[i] == raw_not_na$family[j])){
      check2 <- c(check2, j)
      break
    }
    else{
      if(j==1046) check2 <- c(check2, 0)
    }
  }
}
raw_na$notsame_fare <- check2
for(i in (1:263)){
  raw_na$Age[i] <- ifelse(raw_na$has_same[i] != 0, raw_not_na$Age[raw_na$has_same[i]], raw_not_na$Age[raw_na$notsame_fare[i]])
}

raw_na <- dplyr::select(raw_na, -has_same, -notsame_fare)

raw <- rbind(raw_na, raw_not_na)

raw$Age_group <- ifelse(raw$Age < 20, 0,
                        ifelse(raw$Age < 30, 1,
                               ifelse(raw$Age < 40, 2,
                                      ifelse(raw$Age < 65, 3, 4))))
raw$Age_group <- as.factor(raw$Age_group)
qplot(Survived, data = raw, fill = Age_group)

titanic_data <- dplyr::select(raw, -Age_group, -Fare)
titanic_data <- titanic_data[c(order(titanic_data$PassengerId)),]
rownames(titanic_data) <- NULL

##SVM
check_NA <- is.na(titanic_data$Survived)
train_data <- filter(titanic_data, !check_NA)
train_num <- train_data[,1]
train_data <- train_data[,-1]
test_data <- filter(titanic_data, check_NA)
test_num <- test_data[,1]
test_data <- test_data[,-1]

library(e1071)

svm_model <- svm(Survived ~ ., data = test_data)
Survived<-predict(svm_model,test_data)

solution <- data.frame(PassengerId = 892:1309, Survived = Survived)
write.csv(Survived, file = 'svm_predicton.csv', row.names = F)

table(predict(svm_model, test_data), test_data$Survived)
