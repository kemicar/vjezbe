### Z1 MIRIAN FELICES RUIZ ###

## task 1: creating and using functions ## 
# Write a function named my_func that takes two numbers as arguments and returns a number which is a result of any mathematical function you can think of. Test your function with two sets of numbers.
# First, we create a function called my_func, which will be based on the numbers x and y
my_func <- function(x,y){
    result <- (x+y)*x
    return (result)
}
# Now we have to test it with 2 different sets of numbers. We  are going to associate our next results to the two sets. To test the results, we put the following:
result1 <- my_func(8,9)
result1
print(result1)
#We do the same with another pair of numerbs and we call it result2
result2 <- my_func (14,2)
result2
print(result2)


## task 2: Vector Operations ##
# First, we create a vector containing any 10 integers
vec1 <- c(7,25,25.5,37,41,21,89,77,52,18)
# Calculate the sum of all elements
suma <- function(vector){
  result <- sum(vec1)
  return(result)
}
# We  are going to associate our next result to the sum of the vector
result3 <- suma(vec1)
#Now when we put result3, we will get the sum of the numbers contained in vec1
result3
print(result3)

# To find the mean value of the vector, we are writing this:
mean(vec1)
# When I write this, I get the following result (in red):
#Error: C stack usage  7955688 is too close to the limit
#In order to obtain the mean, I have been trying to create a function as we did with the sum previously and I have finally achieved a result:
mean_value <- function(vector){
  result <- mean.default(vec1)
  return(result)
}
# We  are going to associate our next result to the sum of the vector
result4 <- mean_value(vec1)
#Now when we put result4, we will get the mean of the numbers contained in vec1
result4
print(result4)

#To find the standard deviation of the vector, we are writing this:
standard_deviation <- function(vector){
    result <- sd(vec1)
    return(result)
}
# We  are going to associate our next result to the sd of the vector
result5 <- standard_deviation(vec1)
result5
print(result5)
#I just discovered that by putting the following, we also get the standard deviation result (and in a much simpler way):
sd(vec1)


##Task 3: Working with Matrices and Data Frames##
# Create a data frame df_students with three columns: Name, Age (16-20), and Grade (1-10), filled with sample data of 10 students (the values should come from your manual input)
# First lets make 3 vectors: one for each column. It's important that all vectors must be equally long 
name <- c("Guille", "Edu", "Abril", "Marta", "Laura", "Tomás", "Jesús", "Esther", "Patri", "Aitana")
age <- c(18, 19, 20, 17, 18, 18, 19, 20, 16, 17)
grade <- c(7, 8, 4, 6, 9, 3, 5, 7, 8, 2)
#we will make data frame with these three vectors with data.frame()
data.frame(name, age, grade)
#now we are saving it but data frame as df
df1 <- data.frame(name, age, grade)
df1

# Add a new column “Passed” that indicates with TRUE or FALSE whether the student passed (grade above 5).
#At first I tried creating a new column directly with both the mutate() command and the %>% command, but neither worked.
#Therefore, my plan B was to create a new vector based on a function that decided TRUE or FALSE depending on whether its degree was greater or less than 5, and then create a new data frame with these 4 vectors (the 3 from before + the new one)
#Firstly, we create a new variable called "passed"
passed <- function(grade) {
  if (grade<5){
    passed <- "FALSE"
  } else {
    passed <- "TRUE"}
}
#to test if its correctly done, we try this:
vectornuevo <- passed (7)
vectornuevo
#now we have to do it with all vector "grade"
result_passed <- sapply(grades, passed)
#now we create a data frame with 4 vectors
data.frame(name, age, grade,result_passed)
df2<- data.frame(name, age, grade,result_passed)
df2


# Extract the names of students who passed
passed_students <- df2$name[df2$result_passed == TRUE]
passed_students

# Filter students who are older than 18 and have passed the exam.
# Since we want to filter 2 conditions, we first tried adding the new information with "," but, seeing that this failed, we tried with "&" and we saw that it worked
passed_older_students <- df2$name[df2$result_passed == TRUE & df2$age>18]
passed_older_students

# Calculate the average age of students who passed and those who failed
average_age_passed <- mean.default(df2$age[df2$result_passed == TRUE])
average_age_passed
# Now we do the same for the ones that failed
average_age_failed <- mean.default(df2$age[df2$result_passed == FALSE])
average_age_failed
