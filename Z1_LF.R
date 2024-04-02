##ZADACA 1, Z1
#Lucia Fabijancic

#Task1. Creating and Using Functions
#Write a function named my_func that takes two numbers as arguments and returns a number which is a result of any mathematical function you can think of. 
#Test your function with two sets of numbers.

my_func <- function (first, second) { #this defines my_func as function which has two arguments - first and second
  product <- first ^ second #function will potentiate these two arguments (first and second), as the result I got Inf, which means infinity
  return (product) #it returns product (the result of potentiation, the first to the power of the second)
}

my_func (34, 789) #this is the first example with two arguments which will be potentiated
my_func (456, 0) #this is the second example with two arguments which will be potentiated

#The results I got:
#For the first example - Inf (Infinity)
#For the second example - 1 (sth to the power of 0 is 1)

#Task2. Vector Operations
#Create a vector containing any 10 integers. Write R code to perform the following operations:
#1. Calculate the sum of all elements
#2. Find the mean value of the vector
#3. Find standard deviation of the vector

vec24 <- c(24, 12, 2001, 2, 4, 1, 2, 24.12, 20.01, 2.412) #this is how the vectors are defined, using c() and then writing numbers inside. Numbers should be sperated with comma, and decimal numbers are written with the dot.
sum_all <- sum(vec24) #1st subtask - sum is used to calculate the sum of the numbers I wrote in the vector vec24
sum_all #to print the sum

mean_all <- mean(vec24) #2nd subtask - mean is used to calculate the average value.
mean_all #to print the mean

sd_all <- sd(vec24) #3rd subtask - sd is used to calculate standard deviation
sd_all #to print the standard deviation

#Task3. Working with Matrices and Data Frames
#Create a data frame df_students with three columns: Name, Age (16-20), and Grade (1-10), filled with sample data of 10 students (the values should come from your manual input)
#Add a new column “Passed” that indicates with TRUE or FALSE whether the student passed (grade above 5).
#Extract the names of students who passed.
#Filter students who are older than 18 and have passed the exam.
#Calculate the average age of students who passed and those who failed.

vec2 <- c("Lucia", "Tina", "Lea", "Vanja", "Manuel", "Ivana", "Nikolina", "Ivan", "Nina", "Armin") #this is the first vector I made with names, it should be put in "" because this vector is not numbers (integer) but characters
vec4 <- c(17, 16, 20, 20, 18, 17, 19, 17, 20, 16) #this is the second vector with ages
vec20 <- c(3, 6, 2, 9, 10, 8, 9, 1, 7, 5) #this is the third vector with grades

df_students <- data.frame(Name=vec2, Age=vec4, Grade=vec20) #with this line I told the program to define df_students as dataframe which has three columns and each is called as it is said in the task
df_students #to write the table
View(df_students) #to see it in the new window as table

vec242 <- vec20 > 5 #this compares every element in the vector vec20 with number 5, if it is grater than number five it will say TRUE, otherwise it will state it as FALSE
vec242 #this is to print TRUE or FALSE, just to be sure
df_students <- data.frame(Name=vec2, Age=vec4, Grade=vec20, Passed=vec242) #to print another column in the table which is called Passed
View(df_students) #to see it in the new window as table

# install.packages("dplyr") #this line is to install package called "dplyr", it is used for manipulation of information, such as filtering and sorting
library("dplyr") #to be able to use this package
names_passed <- df_students %>% #I defined names_passed as df_students which are filtered for students that passed the test, and along with that it would return only names (this is done with select())
  filter(Passed==TRUE) %>% select(Name) #%>% is called pipe and it is used for multiple functions
names_passed #to print names of students which passed the test; Tina, Vanja, Manuel, Ivana, Nikolina, Nina

age_passed <- df_students %>% #this is the filter for students that passed the exam and are older than 18
  filter (Passed==TRUE, Age>18) %>% select(Name) #I put two filters, that they have passed the exam as well as that they are older than 18 and selected by their Name
age_passed #Vanja, Nikolina, Nina

average_passed <- df_students %>%
  filter(Passed==TRUE) %>% select(Age) #I seleceted all ages from the students that have passed
average_passed 
mean_passed <- mean(average_passed$Age) #It calculated the mean of the Age which is filtered only by the students that have passed the exam
mean_passed #18.33

average_failed <- df_students %>%
  filter(Passed==FALSE) %>% select(Age)
average_failed
mean_failed <- mean(average_failed$Age) #I did the same as before but the only thing I changed is that I have put the filter as FALSE (that the students have failed the test)
mean_failed #17.5
 
#For this homework I have used my own scripts from Vjezbe as well as Internet browsing and Help in R






