# Z1
# Homework 1

# task 1 - functions

# for the 1.task I started my function as: my_func<- function
# and in the brackets I put x and y, they represent 2 numbers
# than I opened the next bracket {
# in the next row I wrote the name of the function (subtraction)
# and I gave it a mathematics func.(subtracting 2 numbers,
# the first number is raised to the power of 2 and
# the second number is raised to the power of 3
# in the end I wrote return(subtraction), and 
# closed the bracket in the last row
# I also tested the function with two sets of numbers (-2,6) and (35, 9.4)

# the whole task:

my_func<-function(x,y) {
  subtraction <-x^2-y^3
  return(subtraction)
}
my_func(-2,6)              
my_func(35,9.4)



# task 2 - vectors

# for the 2.task I started with creating a vector of random 10 numbers
# so I wrote vec1<-c(3,16,28,34,42,51,65,79,87,90)
# in the next row I wrote sum of vec1 to calculate 
# the sum of all elements of the vector
# I also wrote mean(vec1), to find the mean value of the vector
# the last row sd(vec1), which calculates the standard deviation of the vector


# the whole task:

vec1<-c(3,16,28,34,42,51,65,79,87,90)
sum(vec1)
mean(vec1)
sd(vec1)



# task 3 - matrices

# a) first I wrote 3 vectors
# vector name, with 10 random names
# vector age, with ages from 16 to 20
# vector grade, with random numbers from 1 to 10
# than I connected this 3 vectors in a frame with 
# data.frame called df_students and I 
# ran df_students to see the table



name<-c("Klaudija","Monika","Noemi","Arian","Dante",
        "Stipe","Samanta","Margareta","Fabijan","Noa")
age<-c(19,20,16,17,20,18,16,20,19,19)
grade<-c(6,7,5,4,9,8,7,10,9,8)

df_students<-data.frame(name,age,grade)
df_students


# b) to add a new column called passed, which 
# tells us who got a grade higher than 5 I
# selected df_students with grade> than 5
# in the next row I added passed to the data.frame df_students and
# ran df_students to check if the column was added 


passed<-grade>5
passed
df_students<-data.frame(name,age,grade,passed)
df_students


# c) than I extracted the names of the students who passed
# by creating a new vector called students_passed


students_passed<-name[c(passed)]
students_passed


# d) for filtering students who are older than 18 and have passed I
# created a new vector that includes the name of the students,
# the students who have passed and who are older than 18, by
# using "&" to connect this conditions 


? '&'
older_students_passed<-name[c(passed & age>18)]
older_students_passed


# e) to calculate the average age of the students
# who failed I used mean() without the 
# students who passed 
# and to calculate the average age of the students who
# passed I also used mean but without the students who failed


mean_failed<-mean(age[3:4])
mean_failed
mean_passed<-mean( age [ -(3:4)] )
mean_passed


or


# or I could use operator $ to extract necessary 
# data such as age of only the students that have/haven't passed


?"$"
mean_st_failed<-mean(df_students$age[df_students$passed==T])
mean_st_failed
mean_st_passed<-mean(df_students$age[df_students$passed==F])
mean_st_passed
