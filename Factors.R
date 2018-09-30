grades= sample(c('A','B','C','D'), size = 30, replace = T, prob = c(0.4,0.2,0.3,0.1))
grades
summary(grades)
gradesF=factor(grades)
summary(gradesF)  

table(grades) #counts the unique value even if it is not a factor
table(gradesF)
?table

class(gradesF)
class(grades)

(gradesFO=factor(grades, ordered = T))

(gradesFO1=factor(grades, ordered = T, levels = c('B','C','A','D')))
summary(gradesFO1)

(marks = ceiling(rnorm(30, mean=60, sd=5)))
(gender= factor(sample(c('M','F'), size= 30, replace = T)))
(student1= data.frame(marks,gender, gradesFO1))
boxplot(marks ~ gradesFO1, data=student1)
boxplot(marks ~ gradesFO1+ gender, data=student1)
summary(marks)
quantile(marks)
