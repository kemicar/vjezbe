#Homework 1

#Task 1
#Creating and using functions

#x-coordinate of the vertex of quadratic equation:

my_func <- function(a, b){
  x <- -b/2*a
  return(x)
}

primjer1 <- my_func(2, 3)
primjer1

primjer2 <- my_func(-1, 2)
primjer2

primjer3 <- my_func(1, -2)
primjer3

primjer4 <- my_func(0.2, -1.3)
primjer4


#Task 2
#Vector operations

vec1 <- c(30,29,28,27,26,25,24,23,22,21)

#All elements of the vector can be added using the sum command:
sum_vec1 <- sum(vec1)
sum_vec1

#The mean value of the vector elements is calculated using the mean command:
arithmetic_mean <- mean(vec1)
arithmetic_mean

#The standard deviation of the vector elements is calculated using the sd command:
standard_deviation <- sd(vec1)
standard_deviation


#Task 3
#Matrices and data frames

#Dataframes are lists with vectors
#To create a dataframe, we must first create vectors with the desired data:

vec_ime <- c("Mateo","Lucija","Ivano","Luka","Mia","Petar","Pia","Rafael","Iva","David")
vec_dob <- c(20, 20, 16, 17, 16, 18, 19, 19, 16, 17)
vec_razred <- c(10, 10, 2, 4, 2, 8, 6, 6, 2, 4)

#A data frame with these three vectors can be created using the data.frame command:
df_students <- data.frame(vec_ime, vec_dob, vec_razred)
df_students

#The names of the columns are changed as follows:
df_students2 <- data.frame(Ime=vec_ime, Dob=vec_dob, Razred=vec_razred)
df_students2

#To see the data in the form of a table, we use commands View (classic R package) and view ("tidyverse package):
View(df_students2)
view(df_students2)

#In order to add a new information about students, it is necessary to create a new vector:
vec_ocjene <- c(10,5,8,3,7,9,1,4,6,8)
vec_ocjene
df_students3 <- data.frame(Ime=vec_ime, Dob=vec_dob, Razred=vec_razred, Ocjene=vec_ocjene)
df_students3

#To separate the students who passed the exam(grade above 5):
df_students4 <- vec_ocjene > 5
df_students4

#Adding information about exam:
df_students5 <- data.frame(Ime=vec_ime, Dob=vec_dob, Razred=vec_razred, Ocjene=vec_ocjene, Prolaz=df_students4)
df_students5
View(df_students5)

#Extracting the names of students who passed the exam(from the data for the name, the data of those names that passed the exam are extracted):
students_passed <- vec_ime[df_students4]
students_passed

#Filtering students who are older than 18 and have passed  the exam:
df_students6 <- vec_ime[df_students4 & vec_dob > 18]
df_students6

#To calculate the average age of students who passed, their age data is first extracted, then the average mean:
age_students_passed <- vec_dob[df_students4]
age_students_passed
mean(age_students_passed)

#for the opposite action is used !:
age_students_failed <- vec_dob[!df_students4]
age_students_failed
mean(age_students_failed)
