

#create vectors
(gender= sample(c('M','F'), size= 100, replace = T, prob = c(0.3,0.7)))
(spl= sample (c("MM","HR", "FIN"), size= 100, replace= T, prob=c(0.2,0.1,0.7)))
(grades = sample(c("A","B","C","D"), size= 100, replace= T, prob= c(0.2,0.1,0.3,0.4)))
(placement= sample(c("Yes","No"), size = 100, replace= T, prob = c(0.6,0.4)))  
(age= sample(c(21:31), size=100, replace= T))  
(experience= rnorm(100, mean = 4, sd = 1))  

#create datafarme
?data.frame
students= data.frame(gender, spl, grades, placement, age, experience, stringsAsFactors = T)
head(students)
summary(students)

#convert relevant columns to factors
?factor
(genderF= factor(gender))
(splF= factor(spl))
(gradesF= factor(grades, ordered = T, levels = c("D","C","B","A")))
(placementF= factor(placement))
 
#convert relevant columns in students to factors 
(gender= factor(students$gender))
(spl= factor(students$spl))
(grades= factor(students$grades, ordered = T, levels = c("D","C","B","A")))
(placement= factor(students$placement))



#summarize students
summary(students)

#summarize the data in various ways using dplyr
library(dplyr)
students %>% group_by(gender) %>% summarise(mean(experience), max(experience), mean(age))

students %>% group_by(spl,gender) %>% summarise(max(experience)) 
students %>% filter(spl!= "MM") %>% group_by(spl) %>% summarise(mean(age))

#draw few graphs to understand the distribution of data
hist(students$experience)
t1= table(students$placement)
barplot(t1, col= 1:2)
boxplot(students$age)
pie(t1)
par(mfrow= c(2,2)) #displays below 4 pie charts in one screen [mfow: screen gets divided into frames]
pie(table(students$gender))
pie(table(students$spl))
pie(table(students$placement))
pie(table(students$grade))

par(mfrow=c(1,1))
table(students$gender, students$placement, students$spl)

?write.csv
write.csv(students, file = "./data/students.csv")
studentsX= read.csv("./data/students.csv")
head(studentsX)

#clustering
km3= kmeans(students[,c('age','experience')],centers = 3)
km3
km3$centers

#decision tree
library(rpart)
library(rpart.plot)

tree= rpart(placement~., data=students)
tree
rpart.plot(tree, nn=T, cex= 0.8)
printcp(tree)
tree2=prune(tree, cp=0.09)
rpart.plot(tree2, nn=T, cex = 0.8)

ndata= sample_n(students,3)
ndata
predict(tree, newdata= ndata, type= "class")
predict(tree, newdata= ndata, type="prob")

#logistic regression
logitmodel1 = glm(placement~., data=students, family = "binomial")
summary(logitmodel1)
logitmodel2= glm(placement~ age+ gender, data= students, family="binomial")
summary(logitmodel2)

#linear regression
linear1= lm(age~., data=students)
summary(linear1)
summary(students)
