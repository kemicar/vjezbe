#Task 1: Creating and Using function
my_func<-function(x,y){
  division<-x/y
  return(division)
}
my_func(25,5)
my_func(244,42)

#Task 2: Creating a vector with 10 integers and calculating sum, mean value and standard deviation of that vector 
vecA<-c(-14,4,6.5,21,73,92,18,-1.5,23,84)
sum(vecA)
mean(vecA)
sd(vecA)

#Task 3: Date frames and matrices
#creating a data frame with 3 columns
name<-c("Dominik","Borna","Karla","Talia","Iva","Niko","Nika","Mea","Ivano","Julija")
age<-c(18,17,20,16,19,18,19,17,16,17)
grade<-c(7,6,8,4,9,7,8,5,3,4)
df_students<-data.frame(name,age,grade)
View(df_students)

#Add a new column "Passed"
df_students$passed <- ifelse(df_students$grade>5,T,F)
View(df_students)

#Extract the names of students who passed
passed_students <- subset(df_students, passed == T)
passed_students$name

#Filter students who are older than 18 and have passed the exam
passed_students_of_age <- subset(df_students, passed == T & age>18)
passed_students_of_age$name

#Calculate the average age of students who passed and those who failed
mean(subset(df_students,passed == T)$age)
mean(subset(df_students,passed == F)$age)