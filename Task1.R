#EXERCISE1-PABLOSANCHEZCRESPO

#TASK1

my_func <- function(x,y){
  my_func <- (2*x)/y
  return(my_func)
}
result1 <- my_func(5,10)
result2 <- my_func(24,12)
#In this task, I have created a random ecuation with two variables, x and y. After that, I selected 2 different pairs of numbers, (5,10) and (2,12),to check if my_func was written correctly. 

#TASK2 
#First, I am writing a vector, called vec1, that contains 10 numbers and write view(vec1) to show it in the console:

vec1 <- c(2,4,6,8,10,12,14,16,18,20)
vec1

#Now, using sum(vec1), it is possible to calculate the sum of all elements:

sum(vec1)

#After that, mean (vec1) to calculate the mean of all values:

mean(vec1)

#Finally, sd (vec1) to calculate the standard deviation of all values:

sd(vec1)

#TASK3

#To create a data frame with 3 different columns: Name, Age and Grade; we first need to create 3 vectors:

vec1 <- c("Alex", "Alvaro", "Laura", "Andrea", "George", "Victor", "Lucy", "Frank", "Sebas", "Mara")
vec2 <- c(17, 19, 20, 16, 17, 18, 19, 18, 20, 16)
vec3 <- c(4, 2, 8, 6, 9, 1, 10, 5, 2, 7)

#Once we have them, I create a data frame with the 3 columns and print it in the console:

dataframe1 <- data.frame(Name=vec1, Age=vec2, Grade=vec3)
print(dataframe1)

#Now, I add a 3rd column by creating a new dataframe and a new vector (I tried to do it with "if" and "else" conditional, but I was not able because I did not found the way to add it correctly so I did it like this):

vec4 <- c("FALSE", "FALSE", "TRUE", "TRUE", "TRUE", "FALSE", "TRUE", "TRUE", "FALSE", "TRUE")
Passed <- vec4

print(dataframe2)

#After that, I extract the names of the students that have passed:

Passed_students <- dataframe2$Name[dataframe2$Passed == TRUE]
Passed_students

#Now, I filter which students which students have passed and are older than 18 at the same time:

Passed_students_older18 <- dataframe2$Name[dataframe2$Passed == TRUE & dataframe2$Age > 18]
Passed_students_older18

#Calculate the average age of students that have passed 

average_age_students_passed <- mean(dataframe2$Age [dataframe2$Passed == TRUE])
average_age_students_passed

#Finally, the average age of the ones that have failed:

average_age_students_failed <- mean(dataframe2$Age [dataframe2$Passed == FALSE])
average_age_students_failed
