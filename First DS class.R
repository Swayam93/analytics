#Data structure in R

#Vectors----
x=1:10  #create seq of nos from 1 to 10
x
x1<- 1:20
x1
(x1=1:30) #creates and prints simultaneously..only for practice purpose
(x2=c(1,2,3,13,4,5))  #c: concatenate
class(x2)
?c #help
(x3=letters[1:10])
class(x3)
LETTERS[1:26]
(x3b=c('a',"swayam","4"))
class(x3b)

(x4=c(T,FALSE,TRUE,T,F))
class(x4)

x5=c(3L,5L)
class(x5)
(x5b=c(1,'a', T, 4L))
class(x5b)

#access elements
(x6=seq(0,100,by=3))
methods(class='numeric')
?seq
#[1] 0 2 4  6 8 10
ls() #variables in my environment
x6
length(x6)
x6[20]
x6[3] #access 3rd element
x6[c(2,4)] #access 2nd and 4th element
x6[-1] #access all but first element
x6[-c(1:10)] #removes 1 to 10 positions
x6[c(2, -4)] #cannot mix pos n neg integers
x6[c(2.4,3.54)] #real numbers are trucated to integers
x6[-(length(x6)-1)]
(x7=c(x6,x2))
#modify
sort(x6)
sort(x6, decreasing = T)
rev(x6)

seq(-3, 10, by=.2)
(x=13:2)
(x=-3:2)

x[2] <- 0; x #modify 2nd element
x
x<0
x[x<0]=5;x #modify elements less than 0
x

x= x[1:4]; x

#delete a vector
(x= seq(1,5, length.out = 15))
x= NULL
x

(x= rnorm(100))
plot(density(x))
(x1= rnorm(1000, mean= 50, sd=5))
plot(density(x1))
abline(v= mean(x1),h=0.04)
mean(x1)



#matrices----
100:11
(m1= matrix(1:12, nrow=4))
(m2= matrix(1:12, ncol=3, byrow=T))
x=101:124
matrix(x, ncol=6)
attributes(m1)
dim(m1)
#access elements of matrix
m1[1,2:3]
m1[c(1,3),]

#names of cols and rows
paste("c","d", sep= "-")
paste("c",1:100, sep= "-")

(colnames(m1)= paste("c",1:3, sep= " ")) #same for rownames
m1

#vector to matrix
(m3=1:24)
dim(m3) = c(6,4)
m3

rbind(m2, c(50,60,70))
cbind(m2, c(50,60,70,80))
m2
colSums(m1); rowSums(m1)
colMeans(m1); rowMeans(m1)

t(m1)
sweep(m1, MARGIN = 1, STATS = c(2,3,4,5), FUN = "+") #Row wise
sweep(m1, MARGIN = 2, STATS = c(2,3,4), FUN = "*")  #col wise
#addmargins
m1
addmargins(m1, margin = 1,sum)
addmargins(m1, margin = 2,sum)

addmargins(m1, 2, mean) #row wise function
addmargins(m1, c(1,2), mean)
addmargins(m1, c(1,2), list(list(mean, sum, max), list(var,sd)))
#array----


#dataframe----
(rollno= 1:30)
(sname = paste('student',1:30, sep=''))
(gender = sample(c('M','F'), size=30, replace= T, prob = c(.7,.3)))
(marks = floor(rnorm(30, mean = 50, sd=10)))
(marks2 = ceiling(rnorm(30,40,5)))
(course = sample(c('BBA','MBA'), size = 30, replace=T, prob= c(.5,.5)))
rollno; sname; gender
marks; marks2; course

#create df
df1= data.frame(rollno, sname, gender, marks, marks2, course, stringsAsFactors = F)
str(df1) #structure of ds
head(df1) #top 6 rows
head(df1, n=3) #top 3 rows
tail(df1)
summary(df1)
df1$gender = factor(df1$gender)
df1$course = factor(df1$course)
str(df1)
summary(df1)


#list----

#factor----