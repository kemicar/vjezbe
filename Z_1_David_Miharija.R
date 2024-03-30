#Task 1: Creating and Using Functions
#Write a function named my_func that takes two numbers as arguments and returns a number which is a result of any mathematical function you can think of. Test your function with two sets of numbers.


#We begin by designating a variable my_func as a function with two arguments: x and y
my_func <- function(x,y) {
  #After adding the parenthesis, we can begin writing this function.
  #The function has to take x and y arguments and return another number. We'll call this number z.
  #To make things spicy, we'll make this function a logarithmic function, where y will be the base of the logarithm, while the x will be the argument of the logarithm.
  #Our resulting value z will be defined by this function.
  z<-log(x, base=y)
  #Finally, we have to tell the function to return the value z.
  return(z)
  #And then we close the parenthesis, thereby also closing the function
}
# To test this function, we'll pick several pairs of bases(y) and arguments(x) whose logarithms can easily be checked without a calculator.
my_func(10,10)
my_func(100,10)
my_func(9,3)
my_func(16,2)
#All of the inputs gave the correct results, meaning we successfully programmed a base-universal logarithmic function.




#Task 2: Vector Operations
#Create a vector containing any 10 integers. Write R code to perform the following operations:
  #Calculate the sum of all elements
  #Find the mean value of the vector
  #Find standard deviation of the vector


#To begin let us make the required vector.
vec_z<-c(12,34,67,22,3,89,146,44,200,7)
vec_z
#Next, we will make a new value called suma which will be defined via function sum(), which calculates a sum of all elements of a vector, with the vector vec_z in as the argument.
suma<-sum(vec_z)
suma
#The sum has been calculated and it equals 624.
#Next, we will calculate the mean value of the vector as a new variable called mean using the function mean(). 
mean<-mean(vec_z)
mean
#The resulting value equals 62.4.
#Alternatively, we could have just divided the value suma with the number of elements (10) to get the same result.
mean<-suma/10
mean
#Finally, we have to calculate the standard deviation of the vector. We can't use a pre-made function for this, so we'll have to make a new function.
stdev<-function(vec) {
  mean<-mean(vec)
  N<-length(vec)
  total<-0
  for (x in vec) {
    total<-total+(x-mean)**2
  }
  stdev<-sqrt(total/N)
  return(stdev)
}
#We used mean function to calculate the mean of the vector and function length to calculate the number of elements.
#Next we define the new value total as a zero. This value will be used to calculate the sum of squared values of subtractions of the mean value from all elements of the vector.
#We can use this value to finally calculate the standard deviation as a square root of the total value divided by the number of elements.
#Finally, we just tell the function to return the calculated standard deviation.
stdev_vec_z<-stdev(vec_z)
#We can calculate the standard deviation of vec_z and define it as a new variable wich we can then call.
stdev_vec_z
# We get the resulting standard deviation, which amounts to 62.10185.




#Task 3: Working with Matrices and Data Frames
#Create a data frame df_students with three columns: Name, Age (16-20), and Grade (1-10), filled with sample data of 10 students (the values should come from your manual input)
#Add a new column “Passed” that indicates with TRUE or FALSE whether the student passed (grade above 5).
#Extract the names of students who passed.
#Filter students who are older than 18 and have passed the exam.
#Calculate the average age of students who passed and those who failed.


#Firstly, we will make 3 new vectors containing names, ages and grades of 10 different students.
Name<-c('Marko', 'Nikola', 'Ema', 'Tea', 'Lea', 'Petar', 'Eva', 'Ana', 'Marin', 'Tomo')
Age<-c(17, 16, 19, 17, 16, 20, 17, 20, 17, 18)
Grade<-c(8, 4, 8, 5, 2, 1, 1, 10, 9, 6)
#Next, we combine them into a data frame.
df_students<-data.frame(Name, Age, Grade)
View(df_students)
#We will then make a new function which goes trough each student's grade and adds a true or false value into a new vector depending on if the student passed the class. 
#The function then adds the vector containing these values as a new column in the data frame.
passed<-function(students){
  students$Grade
  Passed<-c()
  for (x in students$Grade) {
    if (4<x) {
      Passed<-append(Passed,T)
    }
    else {
      Passed<-append(Passed,F)
    }
  }
  Passed<-data.frame(Passed)
  df_students<-cbind(df_students,Passed)
  return(df_students)
}
df_students<-passed(df_students)
df_students
#To get the names of students who passed the class, we will extract their names into a new vector.
#The function checks for each student if their 'passed' value from previous function is true.
#If it's true, then the function adds the corresponding name to the new vector.
extract<-function(students){
  extract<-c()
  for (x in 1:nrow(students)) {
    if (students[x,4]==TRUE) {
      extract<-append(extract,students[x,1])
      print(extract)
      print(students[x,4])
    }
  }
  return(extract)
}
success<-extract(df_students)
success
#Next we want to make a function which can sort out only those students aged or older than 18 and which passed the class.
#This function will append the name of students into a new vector only if these two conditions are satisfied.
#It does this by checking if the name of the student is in the vector made by the previous function and if their age is greater than 17.
extractage<-function(students,success) {
  older<-c()
  for (x in 1:nrow(students)) {
    if (students[x,1] %in% success && students[x,2]>17 ) {
      older<-append(older,students[x,1])
    }
  }
  return(older)
}
adult<-extractage(df_students,success)
adult
#Although this wasn't requested, I went ahead and made a function that sorts for students which failed the class 
#in the similar manner as the function for those that passed just for fun.
extractfail<-function(students){
  extract<-c()
  for (x in 1:nrow(students)) {
    if (students[x,4]==FALSE) {
      extract<-append(extract,students[x,1])
      print(extract)
      print(students[x,4])
    }
  }
  return(extract)
}
fail<-extractfail(df_students)
fail

#Finally, we want to calculate the average age of students that passed and failed separately.
#This function makes two vectors for both groups and checks each student's 'Passed' value. Depending on this value, it then adds their grades into the corresponding vector.
#The function then calculates the mean values of both these vectors.
#As far as I know, a function can only return one value.
#Therefore, we will return both means as components of a single vector.
#After the returning value of the function is saved as a variable,
#we can separate both of these means as new variables.
average<-function(students){
  sump<-c()
  sumf<-c()
  for (x in 1:nrow(students)) {
    if (students[x,4]==TRUE) {
      sump<-append(sump,students[x,2])
    }
    else if (students[x,4]==FALSE) {
      sumf<-append(sumf,students[x,2])
    }
  }
  avp<-sum(sump)/length(sump)
  avf<-sum(sumf)/length(sumf)
  return(c(avp,avf))
}
averages<-average(df_students)
avp<-averages[1]
avf<-averages[2]
avp
avf