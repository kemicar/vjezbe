vec7<-c(2,3.5,4,5.34,6)
vec7[3]
vec7[3:5]
vec7[-3]
print(vec7)

vec7b<-vec7[-3]
vec7b

vec8<-c(1E-3,1E4)
print(vec8)

log(vec8)
log(vec8, base = 10)
log(vec8, base = 2)
log(vec8, base = 8)

exp(vec8)


vec9<-c(21,22,19,23,28,32,23.5)
cut_vec9<-cut(vec9, breaks = 3)
cut_vec9
cut_vec9<-cut(vec9, breaks = 3, right = F)
?cut
cut_vec9
cut_vec9<-cut(vec9, breaks = 3, right = T)
cut_vec9


vec10<-c(2:5)
vec10
cut_vec10<-cut(vec10, breaks = 2)
cut_vec10

cut_vec10<-cut(vec10, breaks = 2, labels = c('Group1', 'Group2'))
cut_vec10
vec10


vec10
split_vector<-c(0,2,4,6)
split_vector

split_vec10<-cut(vec10, breaks = split_vector)
vec10
split_vec10

category<-cut(vec10, breaks = split_vector, labels = c('first', 'second', 'third'), ordered_result=T)
category
category<-cut(vec10, breaks = split_vector, labels = c('first', 'second', 'third'), ordered_result=F)
category


#text vectors
text_vec<- 'Beautiful, day'
strsplit(text_vec,',')

gene<-'ATGCTGUUAGCTUGT'
stopcodon<-'UAG'

strsplit(gene,stopcodon)

polypeptides<-strsplit(gene, stopcodon)
polypeptides

gene2<-paste0(gene, stopcodon)
gene2


#zadatak
ages<-c(5,7,8,10,25,30,44,50,68,70)
age_groups<-cut(ages, breaks = c(0,30,60, Inf), labels = c('Young', 'Middle-aged', 'Elderly'))
age_groups
ages


vec1<-c(1,2,3,4,5,6,7,8,9)
vec3<-c('severe', 'mild', 'control')                
vec4<-as.factor(c('severe', 'mild','mild'))
list_vec<-list(vec3,vec4, vec1)
list_vec

list_vec[1]
length(list_vec)

list_vec[1]
list_vec[1]<-NULL
length(list_vec)

list_vec<-list(vec3, vec4, vec1)
list_vec

first_part<-list_vec[1:2]
second_part<-list_vec[3]

first_part
second_part


vec11<-c(1:10)
mat<-matrix(vec11, ncol = 5, nrow = 2)
mat

mat<-matrix(vec11, 5, 2)
View(mat)


mat[2,2]
mat[1:5,2]
mat[2,1:5]
mat[c(2,5), 2]

colnames(mat)<-c('a', 'b')
mat
View(mat)
rownames(mat)<-c('c', 'd', 'e', 'f', 'g')
mat
View(mat)



#drugidio
suma <- function(x, y) {
  zbroj <- x + y 
  return(zbroj)
}

suma(1,2)
suma(5,-7)

oduzimanje<- function(x,y,z) {
  zbroj <- x - y - z
  return(zbroj)
}

primjer1<- oduzimanje(1,2,3)
primjer1

logsuma<-function(val1,val2) {
  zbroj<-log10(val1)+log10(val2)
  return(zbroj)
}

primjer3<-logsuma(2,5)
primjer3

pH<-function(konc) {
  ph_vrijednost<- -log(konc)
  return(ph_vrijednost)
}

pH(0.002)
pH(3E-5)

toxic_unit<- function(conc, ac50) {
  tu<- conc/ac50
  ltu<-log10(tu)
  return(ltu)
}

primjer4<-toxic_unit(0.005, 0.01)
primjer4

concentration<-0.005
ac50<-0.01

primjer5<-toxic_unit(concentration,ac50)
primjer5

sava_spojevi<-c(0.01,0.002,0.0005)
ac50<-c(0.34,1.5,0.001)

primjer6<-toxic_unit(sava_spojevi,ac50)
primjer6

bmi_classifier<-function(m,v) {
  bmi_calculation<-m/v**2
  if(bmi_calculation<25) {
    bmi_class<-'Good'
  } else {
    bmi_class<-'Could be better'
  }
  return(c(bmi_calculation, bmi_class))
}

primjer7<- bmi_classifier(80, 1.83)
primjer7

pH<-function(konc) {
  pH_vrijednost<- -log10(konc)
  if(ph_vrijednost<7) {
    ph_klasa<-'acid'
  }else {
    ph_klasa<- 'alkaline'
  }
  return((c(pH_vrijednost,ph_klasa)))
}

#packages

install.packages('tidyverse')
library(tidyverse)
stopifnot(require('tidyverse'))

stopifnot(getRversion(>='4.1.0'))

getRversion()

#dataframes
vec1<- c(1,2,3,4,5,6,7,8,9)
vec2<-c(T,F,F,T,F,F,F,T,T)
vec3<- sqrt(vec1**2)

data.frame(vec1,vec2, vec3)

df1<- data.frame(vec1, vec2, vec3)
df1

df2<- data.frame(yes_no=vec2, patient=vec3)
df2

View(df2)
view(df2)

write.table(x=df2,
            file = 'pokusaj.txt',
            row.names = F,
            col.names = T,
            sep = ':')
getwd()

tablica<-read.table(file = 'pokusaj.txt',
                    sep = ':',
                    header = TRUE,
                    stringsAsFactors = T)
View(tablica)

df3<-read.table(file = 'data.txt',
                sep = '\t',
                
my_data<-read.delim(file.choose(),
                    stringsAsFactors = FALSE,
                    sep = ':',
                    header = TRUE,
                    dec = '.')

install.packages('readxl')

                

