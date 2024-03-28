vec7 <- c(24,5.4,7,6,4.4)
vec7 [3]
print(vec7)
vec7 [3:5]
vec7 [-3]
print(vec7)
vec7b <-vec7[-3]
vec7a <-vec7[+9]
rm(vec7a)
vec8<-c(1E-4,1E6)
print(vec8)
log10(vec8)
log(vec8, base=5)
exp(vec8)
vec9<-c(21,19,24,12,16.7,18.5,26)
cut_vec9<-cut(vec9, breaks=3)
cut_vec9
?cut
cut_vec9<-cut(vec9, breaks=3, right=F)
cut_vec9
cut_vec9
cut_vec9<-cut(vec9, breaks=3, right=T)
cut_vec9
vec10<-c(2:5)
vec10
cut_vec10<-cut(vec10,breaks=2)
cut_vec10
print(cut_vec10)
cut_vec10<-cut(vec10,breaks=2, labels=c("Group1","Group2"))
cut_vec10
vec10
split_vector<-c(0,2,4,6)
split_vector
split_vec10<-cut(vec10,breaks=split_vector)
vec10
split_vec10
category<-cut(vec10,
             breaks=split_vector,
             labels=c('first','second','third'),
             ordered_result=F)
print(category)
category<-cut(vec10,
              breaks=split_vector,
              labels=c('first','second','third'),
              ordered_result=T)
print(category)
category<-cut(vec10,
              breaks=split_vector,
              labels=c('first','second','third'),
              ordered_result=F)
print(category)
text_vec<-'I,am,a,machine' 
strsplit(text_vec,',')
gene<-'ATGCTGUUAGCTUGT'
stopcodon<-'UAG'
strsplit(gene,stopcodon)
polypeptides<-strsplit(gene,stopcodon)
polypeptides
gene2<-paste0(gene,stopcodon)
gene2


#Task_1
ages<-c(21,14,36,42,29,87,54,19,38,61)
age_intervals<-c(0,30,60,Inf)
age_groups<-cut(ages,
                breaks=age_intervals,
                labels=c('Young','Middle-aged','Elderly'))
age_groups
ages



#Lists
vec1<-c(1,2,3,4,5,6,7,8,9)
vec3<-c('severe','mild','control')
vec4<-as.factor(c('severe','mild','control'))

list_vec<-list(vec3,vec4,vec1)
print(list_vec)
list_vec[1]
list_vec[9]
length(list_vec)
list_vec[1]<-NULL
length(list_vec)
list_vec
?as.factor


list_vec<-list(vec3,vec4,vec1)
list_vec
first_part<-list_vec[1:2]
second_part<-list_vec[3]
first_part
second_part

?matrix
vec11<-c(1:10)
mat<-matrix(vec11,nrow=2,ncol=5)
mat
mat<-matrix(vec11,2,5)
mat2<-matrix(vec11,nrow=5,ncol=2)
mat
mat2
View(mat)

#prvo redci, pa stupci
mat[2,2]
mat
mat[1,1:5]
mat2[1:5,1]
mat2
mat[2,c(3,5)]
colnames(mat)<-c('a','b','c','d','e')
mat
rownames(mat)<-c('x','y')
mat

vec11
vec12<-c('a','b','c','d','e','f','g','h','i','j')
mat_3<-cbind(vec11,vec12)
mat_3
mat_4<-t(mat_3)
mat_4




#######################Drugi_dio##################################
suma<-function(x,y) {
  zbroj<-x+y
  return(zbroj)
}
suma(1,2)
suma(5,-7)

#Task 2
sub3<-function(x,y,z) {
  razlika<-x-y-z
  return(razlika)
}
sub3(4,5,8)


logsuma<-function(x,y) {
  zbroj<-log10(x)+log10(y)
  return(zbroj)
}
logsuma(10,100)

ph<-function(H) {
  pH<--1*log10(H)
  return(pH)
}
ph(0.00003)


toxic_unit<-function(conc,ac50) {
  tu<-conc/ac50
  ltu<-log10(tu)
  return(ltu)
}
rez1<-toxic_unit(0.005,0.01)
rez1

sava_spojevi<-c(0.01,0.002,0.0005)
ac50<-c(0.34,1.5,0.001)
rez2<-toxic_unit(sava_spojevi, ac50)
rez2


bmi_classifier<-function(m,h){
  bmi<-m/h**2
  
  if (bmi<25) {
    bmi_class='Good'
  } else{
    bmi_class='Could be better'
  }
  return(c(bmi,bmi_class))
}
bmi_classifier(85,1.76)

?elif
ph_status<-function(H) {
  pH<--1*log10(H)
  if (pH<7.5 & pH>6.5){
    pH_status='Neutral'
  } else if (pH<6.5){
    pH_status='Acidic'
  } else if (pH>7.5) {
    pH_status='Basic'
  }
  return(c(pH,pH_status))
}
ph_status(0.00003)
ph_status(0.00000006)

#Packages
install.packages("tidyverse")
library('tidyverse')
stopifnot(require('tidyverse'))
stopifnot(getRversion() >= "4.1.0")

#Data_frames
#liste s vektorima
vecx<-c(1,2,3,4,5,6,7,8,9)
vecy<-c(T,F,F,T,F,F,F,T,T)
vecz<-sqrt(vecx**2)

data.frame(vecx,vecy,vecz)
df1<-data.frame(vecx,vecy,vecz)
df1

df2<-data.frame(yes_no=vecy, patient=vecz)
print(df2)
view(df2)
write.table(x=df2,
            file="prvi_podaci.txt",
            row.names=F,
            col.names=T,
            sep=";") #;,\t(tab) pipe(I)
getwd()
tablica<-read.table(file="prvi_podaci.txt",
                    sep=";",
                    header=TRUE,
                    stringsAsFactor=T)
view(tablica)
df3<-read.table(file="prvi_podaci.txt",
                sep=";",
                header=TRUE,
                stringsAsFactor=T)
view(df3)
df4<-read.table(file="direktorij put",
                sep="\t",
                header=F)
view(df4)
web<-read.table(file="url", sep=",",header=F)
my_data<-read.delim(file.choose(),stringsAsFactor=FALSE,sep=";",header="TRUE",dec=".")


install.packages("readxl")
library("readxl")
c<-read_excel("excel_file.xlsl")
view(c)
d<-read_excel("excel_file.xlsl",sheet = "sheet_2")
view(d)

colSums(is.na(DF)) #tražimo NA vrijednosti
DF<-na.omit(DF) #mičemo ih
colSums(is.na(DF)) #treba biti 0
view(DF)
#.csf najbolji
head(DF) #prvi dio tablice
tail(DF) #drugi dio
names(DF)
nrow(DF)
ncol(DF)
DF$collumn
DF$collumn[2:10]
DF[2]
