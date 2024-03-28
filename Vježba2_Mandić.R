vec1 <-c(1,2,5,7.8)
vec1[3]

print(vec1)

vec8 <- c(1E-3, 1E4)
print(vec8)

log(vec8)

log10(vec8)
log(vec8, base=10)
exp(vec8)

vec9 <- c(21,22,19,25,28,32,23.5)

cut_vec9 <- cut (vec9, breaks=3)
cut_vec9

?cut
cut_vec9 <- cut (vec9, breaks=3, right=T)
cut_vec9

vec10 <- c(2:5)
vec10

cut_vec10 <-cut(vec10, breaks=2)
print(cut_vec10)

cut_vec10 <-cut(vec10, breaks=2, labels=c ("Graoup1", "Group2"))
print(cut_vec10)
print(vec10)

split_vector<-c(0,2,4,6)
split_vector
split_vec10<- cut(vec10, breaks=split_vector)

vec10
split_vec10

category <- cut(vec10,
                breaks= split_vector ,
                labels= c('first','second','third'),
                ordered_results=F)
print(category)

text_vec<- "Chemometrics,is,cool"
strsplit(text_vec,",")

gene <- "ATGCTGUUAGCTUGT"
gene
stopcodon <-"UAG"
strsplit(gene, stopcodon)

polypeptides <- strsplit(gene,stopcodon)
polypeptides

gene2<- paste0(gene,stopcodon)
gene2

#task

ages<-c(5, 18, 25,45,21,50,80,90,101,72)
ages
age_groups<-cut(ages,breaks=c(0,30,60,Inf),
              labels=c("Young","Middle","Elderly"))
age_groups
ages


vec1<- c(1,2,3,4,5,6,7,8)
vec2<- c("severe","mild","control")
vec4<-as.factor(c("severe","mild","control"))

list_vec<-list(vec1,vec2,vec4)
print(list_vec)

list_vec[1]
length(list_vec)

list_vec[1]
list_vec[1]<-NULL
length(list_vec)

list_vec<-list(vec1,vec2,vec4)
print(list_vec)

first_part<-list_vec[c(1:2)]
second_part<-list_vec[3]

first_part

second_part

vec11<- c(1:10)
 mat<- matrix(vec11, ncol=5, nrow=2)
mat 
mat<-matrix(vec11,5,2)
view(mat)

mat2<-matrix(vec11,2,5)
View(mat2)
print(mat)

mat[2,2]
mat

mat[1:5,2]
mat[2,1:2]
mat[c(2,5),2]

colnames(mat)<-c("a","b")
mat
rownames(mat)<-c("c","d","e","f","g")
mat

suma<-function(x,y){
  zbroj <- x+y
  return(zbroj)
  }
suma(1,2)
suma(5,-7)

#task
oduzimanje<-function(x,y,z){
  zbroj<- -x-y-z
  return(zbroj)
}
pr1<-oduzimanje(1,4,6)
pr1



logsuma<-function(val1,val2){
  zbroj<-log10(val1)+log10(val2)
  return(zbroj)
}
pr3<-logsuma(2,5)

#task
ph<-function(konc){
  ph_vrijednost<--log10(konc)
  return(ph_vrijednost)
}
ph(0.002)


toxic_unit<-function(conc,ac50){
  tu<-conc/ac50
  ltu<-log10(tu)
  return(ltu)
}
pr4<-toxic_unit(0.005,0.01)
pr4


concentration<-0.005
ac50<-0.01
pr5<-toxic_unit(concentration,ac50)
pr5

sava_spojevi<-c(0.01,0.002,0.0005)
ac50<-c(0.34,1.5,0.001)
pr6<-toxic_unit(sava_spojevi,ac50)
pr6

bmi_classifier<-function(m,v){
bmi_calculation<-m/v**2

if(bmi_calculation<25){
  bmi_class<-"Good"
}else{
  bmi_class<-"Could be better"
}
return(c(bmi_calculation,bmi_class))
}
pr7<-bmi_classifier(76,1.83)
pr7


#task
ph<-function(konc){
  ph_vrijednost<--log10(konc)
  
  
  if(ph_vrijednost<7){
    pH<-"Acid"
  }else{
    pH<-"Alkaline"
  }
  return(c(ph_vrijednost,pH))
}
pr8<-ph(4)
pr8

install.packages("tidyverse")
library(tidyverse)

vec1<-c(1,2,3,4,5,6,7,8,9)
vec2<-c(T,F,F,T,F,F,F,T,T)
vec3<-sqrt(vec1**2)

data.frame(vec1,vec2,vec3)
df1<-data.frame(vec1,vec2,vec3)
df1

df2<-data.frame(yes_no=vec2,patient=vec3)
print(df2)

view(df2)
View(df2)

write.table(x=df2,
            file="pokusaj.txt",
            row.names=F,
            col.names=T,
            sep=";")
getwd()

tablica<-read.table(file="pokusaj.txt", 
                    sep=";",
                    header=TRUE,
                    stringsAsFactors=T)
View(tablica)
