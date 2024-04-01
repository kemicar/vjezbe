#Task 1 
#Here we are defining a new function which takes two numbers (x and y) 
#and calculates x raised to the 3*y power.
my_func<-function(x,y) {
  a<-x^(3*y)
  return(a)
}
my_func(10,2)
r<-my_func(10,2) 

#Task 2
#After making a new vector, we calculate its 
#sum, mean and standard deviations using pre-made R functions for these values.
vec_1<-c(12,18,25,36,50,60,71,98,99,100)
sum_vec_1<-sum(vec_1)
print(sum_vec_1)
mean_vec_1<-mean(vec_1)
mean_vec_1
sd_vec_1<-sd(vec_1)
sd_vec_1

#Task 3
#We combine three vectors into a new dataframe.
Name<-c('Ena','Sara','Rita','Anita','Tomo','Luna','Rozi','Izzy','Rina','Marko')
Age<-c(16,17,18,19,20,16,17,18,19,20)
Grade<-c(10,7,10,6,2,0,9,4,5,10)
df_students<-data.frame(Name,Age,Grade,row.names = NULL)

#With a new function and for loop we create a new vector and fill it with 
#TRUE and FALSE variables depending if the student passed
#and add it as a new collumn
passed<-function(x) {
  Passed<-c()
  for (a in df_students$Grade) {
    if (a>5) {
      Passed<-append(Passed,TRUE)
    }
    else {
      Passed<-append(Passed,FALSE)
    }
  }
  x<-cbind(x,Passed)
  return(x)
}
df_students<-passed(df_students)

#In the next function, we append the names of students into a new vector 
#if they passed the test
ext<-function(x) {
  names<-c()
  for (a in 1:nrow(x)) {
    if (x[a,4]==TRUE) {
      names<-append(names,x[a,1])
    }
  }
  print(names)
  return(names)
}
Lucky_ones<-ext(df_students)

#Similarly, in this function, we append the names of students into a new vector 
#if they passed the test and are older than 18
ext_age<-function(x) {
  names<-c()
  for (a in 1:nrow(x)) {
    if (x[a,4]==TRUE && x[a,2]>18) {
      names<-append(names,x[a,1])
    }
  }
  print(names)
  return(names)
}
Penzici<-ext_age(df_students)

#In this function we separate the ages into one of the two vectors
#depending on weather or not they passed. We then calculate the means.
average<-function(x) {
  pass<-c()
  fail<-c()
  for (a in 1:nrow(x)) {
    if (x[a,4]==TRUE) {
      pass<-append(pass,x[a,2])
    }
    else {
      fail<-append(fail,x[a,2])
    }
  }
  results<-c(mean(pass),mean(fail))
  return(results)
}
results<-average(df_students)
results
Pass<-results[1]
Pass
Fail<-results[2]
Fail