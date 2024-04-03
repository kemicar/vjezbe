> #HOMEWORK 1
 
#TASK 1, Creating and Using Functions:
#I firstly write the codes to create a function containing 2 variables (x and y), then I created my function.
  > my_func <- function(x,y){
    + func <- (x * y) - (2 * x)
    + return(func)
    + }
  
#After, I tested the function giving real number values to the variables, and see the results (1 and 2). 
  > Result1 <- my_func(2,7)
  > Result1
  [1] 10
  
  > Result2 <- my_func(5,32)
  > Result2
  [1] 150

#TASK2, Vector Operations:
#First, I create my 10 integer vector, and check it.
  > Vec1 <- c(2, 12, 22, 32, 42, 52, 62, 72, 82, 92)
  > Vec1
  [1]  2 12 22 32 42 52 62 72 82 92

#I write codes and check the following operations: sum of elements, mean value and standard deviation.

#Sum of elements:
  > sum(Vec1)
  [1] 470
  
#Mean value:
  > mean(Vec1)
  [1] 47

#Standard deviation:
  > sd(Vec1)
  [1] 30.2765


#TASK3, Working with Matrices and Data Frames:
#First, I created a vector with the name of the students. The integers of this vetor ar in quotes, cince the're not numbers.
  > names <- c("Ana", "Lou", "Bea", "Ash", "Pau", "Ixi", "Lau", "Gonzi", "Mate", "Gus")
  
#Then, I created a vector with the ages of the students, and another one with their grades.
  > ages <- c(18, 16, 19, 20, 17, 17, 19, 18, 20, 17)
  > grades <- c(8, 8, 9, 3, 6, 8, 7, 10, 5, 8)

#I created a dataframe with thee three vectors.
  > df_students <- data.frame(names, ages, grades)
  > df_students
  names ages grades
  1    Ana   18      8
  2    Lou   16      8
  3    Bea   19      9
  4    Ash   20      3
  5    Pau   17      6
  6    Ixi   17      8
  7    Lau   19      7
  8  Gonzi   18     10
  9   Mate   20      5
  10   Gus   17      8

#I tried through different ways I saw online adding a new conditional column that would be able to detect number >5 and assigng them a "true" value, but I haven't found a way that works.
#Due to this, I added a new column, where I wroe manually who passed, and who didn't.
  > df_students$passed <- c("True", "True", "True", "False", "True", "True", "True", "True", "True", "True")
  > df_students
  names ages grades passed
  1    Ana   18      8   True
  2    Lou   16      8   True
  3    Bea   19      9   True
  4    Ash   20      3  False
  5    Pau   17      6   True
  6    Ixi   17      8   True
  7    Lau   19      7   True
  8  Gonzi   18     10   True
  9   Mate   20      5   True
  10   Gus   17      8   True
  
#To extract the name of the students who have passed I wrote the following code:
  > students_passed <- df_students$names[df_students$passed == "True"]
  > students_passed
  [1] "Ana"   "Lou"   "Bea"   "Pau"   "Ixi"   "Lau"   "Gonzi" "Mate"  "Gus"  
  
#I then filtered students that have passed and are older than 18 (without counting students who are 18)
  > older_students_passed <- df_students$names[df_students$passed == "True" & df_students$ages > 18]
  > older_students_passed
  [1] "Bea"  "Lau"  "Mate"
  
#Counting the students who are also 18:
  > older_students_passed <- df_students$names[df_students$passed == "True" & df_students$ages >= 18]
  > older_students_passed
  [1] "Ana"   "Bea"   "Lau"   "Gonzi" "Mate" 
  
#To calculate the average ages of students who passed and failed:
  > average_age_passed <- mean(df_students$ages[df_students$passed == "True"])
  > average_age_passed
  [1] 17.88889
  
  > average_age_failed <- mean(df_students$ages[df_students$passed == "False"])
  > average_age_failed
  [1] 20

  