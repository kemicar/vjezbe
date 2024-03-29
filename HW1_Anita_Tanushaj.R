#Task 1: Creating and using functions:In this task I've asigned a function of 2 variables/numbers (a,b) and called it as "my_func". In the next step I have assigned the result of the function to be a*1/b and in the next step I've written it to give me the result of the function of 2 given numbers in return. 
#I've then tested my function with the chosen set of numbers. 
my_funct <- function( a, b) {
  result <- a * 1/b
  return(result)
}
result_one <- my_funct(100,10)

print(result_one)

result_two <- my_funct(5,5)
print(result_two)

##Task 2: Vector Operations - I've assigned 10 chosen integers to the vector which I've called vec1. By writing the code sum (vec1) i've gotten the sum of all integers in the vector which I've assigned to sum_of_elements. I've done the same steps for mean value of the vector and standard deviation - by calling up the built in functions in RStudio.

vec1 <- c(2, 4, 6, 10, 16, 26, 42, 68, 110, 178)
print(vec1)

sum_of_elements <- sum(vec1)
print (sum_of_elements)
mean_value <- mean(vec1)
print(mean_value)
standard_deviation <- sd(vec1)
print(standard_deviation)

###Task 3: Working with matrices and data frames

df_studdents <- data.frame(
  Name = c("Lea", "Diana", "Andrea", "Lukas", "Andrija", "Franka", "Neo", "Kiki", "Fiona", "Violeta"),
  Age = c(16, 17, 18, 19, 20, 16, 17, 18, 19, 19),
  Grade = c(1, 2, 3, 4, 5, 6, 7, 8, 9, 10)
)
###I've assigned a data set of 3 columns  - Name, Age and Gender to df_students by calling up the built-in function data.frame. 


View (df_studdents)

###I've added a new clomun to the data frame and assigned the values (False,True) to the column ("Passed") using the dollar sign "$" and making a condition (>5).
###All the values that are equal and less than 5 are marked as "false", and bigger than 5 are marked as "true". 

df_studdents$Passed <- df_studdents$Grade >5
print (df_studdents)
View(df_studdents)

###I've used the dollar sign "$" to access the columnn Name of the data and then square brackets to to single out all of the students that have passed (i.e. have "TRUE" under the column "Passed") under the column "Names". 

students_passed <- df_studdents$Name [df_studdents$Passed]
print (students_passed)

### Here I've filtered the list students_passed with the condition that they are older than 18 and it selected only the students who are older than 18 and have passed the exam.

students_older_passed <- students_passed [df_studdents$Age > 18]
print (students_older_passed)

###Calculating the average age od students who passed by selecting only the mean value for the column "Age" using the dollar ($) sign and filtering out the Age of only the students who have Passed using the square brackets. 
###The same logic is used in calculating the average age of students who've failed the exam with the difference of using "!" after the brackets because the exclamation mark negates the value of the expression which means that inside the column Age only the ones who have NOT passed the exam are selected for the calculation of the mean value. 

average_age_passed <- mean(df_studdents$Age[df_studdents$Passed])
print(average_age_passed)

average_age_failed <- mean (df_studdents$Age [!df_studdents$Passed])
print (average_age_failed)
