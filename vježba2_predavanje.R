vec7 <- c(1.237, 2.944, 3, 4, 5.522)
print(vec7)
vec7[3]
vec7[3:5]
print(vec7)
vec7[-3]
print(vec7)
vec7 <- vec7[-3]
print(vec7)

#E-3 = 10^-3
vec8 <- c(1E-3, 1E4)
print(vec8)

#prirodni logaritam 
log(vec8)

#logaritam po bazi 10
log10(vec8)
log(vec8, base=10)

#eksponencijalna funkcija
exp(vec8)
#Inf = infinity

vec9 <- c(21,22,19,25,28,32,23.5)
cut_vec9 <- cut(vec9, breaks=3)
cut_vec9

cut_vec9 <- cut(vec9, breaks=3, right=F)
cut_vec9

cut_vec9 <- cut(vec9, breaks=3, right=T)
cut_vec9
#F ili T koristimo ovisno s koje strane želimo koju zagradu () ili []

vec10 <- c(2:5)
vec10

cut_vec10 <- cut(vec10, breaks=2)
cut_vec10

cut_vec10 <- cut(vec10, breaks=2, labels= c("group1","group2"))
cut_vec10
vec10
#do vrijednosti 3.5 je grupa 1, od vrijednosti 3.5 je grupa 2
#ako se pojavi + umjesto <, esc (jer neki od kodova nije završen)
vec10

split_vector <- c(0,2,4,6)
split_vector

split_vec10 <-  cut(vec10, breaks=split_vector)
vec10
split_vec10

category <- cut(vec10, breaks=split_vector, labels=c("first","second","third"), ordered_result=T)
category

text_vec <- "chemometric, is, cool"
text_vec
strsplit(text_vec, ",")

gene <- "ATGCTGUUAGCTUGT"
gene
stopcodon <- "UAG"
stopcodon
strsplit(gene, stopcodon)
polypeptides <- strsplit(gene, stopcodon)
polypeptides
gene2 <- paste0(gene, stopcodon)
gene2

ages <- c(25,40,18,70,55,32,22,45,60,28)
ages
age_groups <- cut(ages, breaks= c(0,30,60,Inf),labels= c("young","middle-aged","elderly"))
age_groups
ages

vec1 <- c(1,2,3,4,5,6,7,8,9)
vec3 <- c("severe","mild","control")
vec4 <-  as.factor(c("severe","mild","control"))
list_vec <- list(vec3,vec4,vec1)
list_vec
list_vec[1]
list_vec[2]
list_vec[8]
length(list_vec)
list_vec[1] <- NULL
length(list_vec)
#uklanjanje vektora s liste
list_vec <- list(vec3,vec4,vec1)
list_vec
first_part <- list_vec[1:2]
second_part <- list_vec[3]
first_part
second_part
first_part <-  list_vec[c(1,3)]
first_part

vec11 <- c(1:10)
vec11
mat <- matrix(vec11, ncol=5, nrow=2)
mat
mat <- matrix(vec11,2,5)
mat
View(mat)
#view za prikaz tablice gore
print(mat)
mat[2,2]
mat
mat[2,1:5]
mat
mat[c(2,1),2]
mat
colnames(mat) <- c("a","b","c","d","e")
rownames(mat) <- c("f","g")
View(mat)

#funkcije
suma <- function(x,y){
  zbroj <- x+y
  return(zbroj)
}
suma(1,2)
suma(5,-7)

oduzimanje <-  function (x,y,z){
  zbroj <- x-y-z
  return(zbroj)
}
primjer1 <- oduzimanje (1,2,3)
primjer1
primjer2 <- oduzimanje(5,-7,9)
primjer2

logsuma <- function(val1,val2){
  zbroj <- log10(val1)+log10(val2)
  return(zbroj)
}
primjer3 <- logsuma(2,5)
primjer3

pH <- function(konc){
  ph_vrijednost <-  -log10(konc)
  return(ph_vrijednost)
}
pH(0.002)
pH(3E-5)

toxic_unit <- function(conc, ac50){
  tu <-  conc/ac50
  ltu <- log10(tu)
  return(ltu)
}
primjer4 <- toxic_unit(0.005,0.01)
primjer4
concentration <- 0.005
ac50 <- 0.01
primjer5 <- toxic_unit(concentration, ac50)
primjer5
sava_spojevi <- c(0.01,0.002,0.0005)
ac50 <- c(0.34,1.5,0.001)
primjer6 <- toxic_unit(sava_spojevi, ac50)
primjer6

bmi_classifier <- function(m,v){
  
  bmi_calculation <- m/v**2
  
  if(bmi_calculation<25){
    bmi_class <- "good"
  }else{
    bmi_class <- "could be better"
  }
  return(c(bmi_calculation,bmi_class))
}
primjer7 <- bmi_classifier(76,1.83)
primjer7

#zadatak
pH <- function(konc1){
  zbroj <-  -log10(konc1)
  if(zbroj<7){
    pH <- "kiselo"
  }else{
    pH <- "lužnato"
  }
  return(c(zbroj, pH))
}
pH(0.01)
pH(3)

#instaliranje paketa
install.packages("tidyverse")
library("tidyverse")
stopifnot(require("tidyverse"))

vec1 <- c(1,2,3,4,5,6,7,8,9)
vec2 <-  c(T,F,F,T,F,F,F,T,T)
vec3 <- sqrt(vec1**2)
data.frame(vec1,vec2,vec3)
df1 <- data.frame(vec1,vec2,vec3)
df1
df2 <- data.frame(yes_no=vec2, patient=vec3)
df2
View(df2)
view(df2) #malo v za view u tidyverse-u

write.table(x=df2,
            file="pokusaj.txt",
            row.names=F,
            col.names=T,
            sep=";")
getwd()

tablica <- read.table(file="pokusaj.txt",
                      sep=";",
                      header=TRUE,
                      stringsAsFactors=T)
View(tablica)



install.packages("tidyverse")


    



