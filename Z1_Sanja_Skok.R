#####TASK 1:Creating and Using Functions#####

my_function <- function(x,y) {
  equation <- x*y
  return(equation)
}

#this is a function that multyplies two numbers 
example1 <- my_function(2,3)
example1

example2 <- my_function(34.675,-2345.7)
example2


#####TASK 2:Vector Operations#####

vec1 <- c(34:39,51:54)
#vec1 is a numerical vector which contains 10 elements

sum(vec1)
#sum is a function that gives us a sum of all the elements in the vector

mean(vec1)
#mean is a function that gives us the the average of the elements in the vector

?sd
sd(vec1,na.rm = FALSE)
#sd is a function that gives us the standard deviation of the elements in the vector


#####TASK#:Working with Matrices and Data Frames#####

#data frames are lists of vectors
#there are 3 vectors:Name, Age and Grade
Name <- c('Anja','Klara','Marko','Ivan','Lara','Nikola','Luka','Snježana','Višnja', 'Roko')
Age <- c(16,17,18,19,20,17,18,19,16,16)
Grade <- c(9,4,8,2,10,3,8,1,4,10)

data.frame(Name,Age,Grade)
df_students <- data.frame(Name,Age,Grade) 
df_students

#I added another column with the ifelse function
#the new column is called Passed and the arguments are that if the Grade is above 5 then it is TRUE if not then it is FALSE
df_students$Passed <- ifelse(df_students$Grade>5,TRUE,FALSE)
df_students
#the data frame df_students now has a new column Passed

#to extract the names of students with a grade above 5 I used these [] brackets to write [the paramater I was looking for,no row] and for the ages above 18 who passed I added the parameter Age>=18 (equall or more than 18)
df_students[df_students$Grade>5,]
df_students[df_students$Grade>5 & df_students$Age>=18,]

#to calculate the average age of those who passed and failed I used the function aggregate(first the column that I want the average of, then list (the column passed so it knows how to group the ages - TRUE or FALSE), and FUN=mean so that it calculates the average)
aggregate(df_students$Age, list(df_students$Passed),FUN=mean) 