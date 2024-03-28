vec7 <- c(1.237,2.944,3,4,5.5222)
print(vec7)
vec7[3]
vec7[3:5]
vec7[-3]
print(vec7)
vec7b <- vec7[-3]
vec7b
#scientific notation; E -> exponent
vec8 <- c(1E-3,1E4)
print(vec8)
#logarithm calculation
log(vec8)
log10(vec8)
log(vec8, base = 2)
#exponential function calculation
exp(vec8)
#categorisation of vector elements
vec9 <- c(21,22,19,25,28,32,23.5)
cut_vec9 <- c(vec9, breaks = 3)
cut_vec9 <- cut(vec9, breaks = 3, right = F)
cut_vec9
cut_vec9 <- cut(vec9, breaks = 3, right = T)
cut_vec9
#creating a vector with numbers 2 to 5 and categorizing it into 2 categories
vec10 <- c(2:5)
vec10
cut_vec10 <- cut(vec10, breaks = 2)
cut_vec10
cut_vec10 <- cut(vec10, breaks = 2, labels = c("Group1","Group2"))
cut_vec10
print(vec10)
#more complex examples with cut function
split_vector <- c(0,2,4,6)
split_vector
split_vec10 <- cut(vec10,breaks = split_vector)
vec10
split_vec10
#displaying ordinal positions instead of intervals
category <- cut(vec10, breaks = split_vector, labels = c("first","second","third"), ordered_result = F)
category
category <- cut(vec10, breaks = split_vector, labels = c("first","second","third"), ordered_result = T)
category
#text vectors
text_vec <- 'Chemometrics, is, cool'
strsplit(text_vec,',')
gene <- 'ATGCTGUUAGCTUGT'
stopcodon <- 'UAG'
strsplit(gene, stopcodon)
#storing the result as a new vector
polypeptides <- strsplit(gene, stopcodon)
polypeptides
#pasting back
gene2 <- paste0(gene, stopcodon)
gene2

#TASK: create a vector named ages containing the ages of 10 individuals of your choice; use the cut() function to categorise the ages into 3 age groups (young 0-30, middle-aged 31-60, elderly 61+). Store the categorized age groups in a new variable named age_groups.
ages <- c(34,22,6,12,89,45,61,32,18,2)
age_groups <- cut(ages, breaks = c(0,30,60,Inf), labels = c("young","middle-aged","elderly"))
age_groups
ages

#lists
vec1 <- c(1,2,3,4,5,6,7,8,9)
vec3 <- c("severe","mild","control")
vec4 <- as.factor(c("severe","mild","control"))
list_vec <- list(vec3,vec4,vec1)
list_vec
list_vec[1]
list_vec[9]
length(list_vec)
list_vec[1] <- NULL
length(list_vec)
#spliting list into 2 parts
list_vec <- list(vec3,vec4,vec1)
list_vec
first_part <- list_vec[c(1,3)]
second_part <- list_vec[2:3]
first_part
second_part

#matrix
vec11 <- c(1:10)
mat <- matrix(vec11, ncol = 5, nrow =2)
mat
mat <- matrix(vec11, 5, 2) #5 rows and 2 columns
View(mat)
mat_2 <- matrix(vec11, 2, 5) #2 rows and 5 columns
mat_2
#first goes row, second column
View(mat_2)
mat[2,2]
mat
mat[1:5,2]
mat[2,1:2]
mat[c(2,5),2]
#changing column and row names
colnames(mat) <- c("a","b")
rownames(mat) <- c("c","d","e","f","g")
mat

#functions
suma <- function(x,y){
  zbroj <- x + y
  return(zbroj)
  }
suma(1,2)
suma(5,-7)

#TASK no1:make a function that substracts 3 numbers and save results
oduzimanje <- function(x,y,z){
  zbroj <- x - y - z
  return(zbroj)
}
oduzimanje(1,2,3)
oduzimanje(23,-6,-24)
primjer1 <- oduzimanje(1,2,3)
primjer1

#function that adds logarithmic values of 2 numbers (base 10)
logsuma <- function(val1,val2){
  zbroj <- log10(val1) + log10(val2)
  return(zbroj)
}
primjer3 <- logsuma(2,5)
primjer3

#TASK no2: make a function for pH calculation based on concentration
ph <- function(konc){
  pH_vrijednost <- -log10(konc)
  return(pH_vrijednost)
}
ph(0.002)

#calculate toxic unit (EC50)
toxic_unit <- function(conc, ac50){
  tu <- conc/ac50
  ltu <- log10(tu)
  return(ltu)
}
primjer4 <- toxic_unit(0.005,0.01)
primjer4
concentration <- 0.005
ac50 <- 0.01
primjer5 <- toxic_unit(concentration,ac50)
primjer5
#enter values saved as vectors
sava_spojevi <- c(0.01,0.002,0.0005)
ac50 <- c(0.34,1.5,0.001)
primjer6 <- toxic_unit(sava_spojevi, ac50)
primjer6
#advanced example with if else
bmi_classifier <- function(m,v){
  bmi_calculation <- m/v**2
  if(bmi_calculation < 25){
    bmi_class <- "Good"
  } else {
    bmi_class <- "colud be better"
  }
  return(c(bmi_calculation, bmi_class))
}
primjer7 <- bmi_classifier(76,1.83)
primjer7
primjerb <- bmi_classifier(121, 1.83)
primjerb

#TASK no3: make a function for pH calculation based on conc (use log10); make funtion with if else with conditions
pH <- function(konc){
  pH_vrijednost <- -log10(konc)
  if(pH_vrijednost < 7){
    pH_class <- "acid"
  } else{
    pH_class <- "alkaline"
  }
  return(c(pH_vrijednost, pH_class))
}
zdk3 <- pH(0.056)
zdk3

#packages
install.packages("tidyverse")
library("tidyverse")
stopifnot(require("tidyverse"))
getRversion()

#data frames
vec1 <- c(1,2,3,4,5,6,7,8,9)
vec2 <- c(T,F,F,T,F,F,F,T,T)
vec3 <- sqrt(vec1**2)
data.frame(vec1,vec2,vec3)
df1 <- data.frame(vec1,vec2,vec3)
df1
df2 <- data.frame(yes_no = vec2, patient = vec3)
df2
View(df2)
view(df2)
write.table(x = df2,
            file = "pokusaj.txt",
            row.names = F,
            col.names = T,
            sep = ";")
getwd()
tablica <- read.table(file = "pokusaj.txt",
                      sep = ";",
                      header = TRUE,
                      stringsAsFactors = T)
View(tablica)