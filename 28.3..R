vec8<-c(3,4,5,6)
vec8

> vec7<-c(1.237,2.944,3,4,5.5222)
vec7[3:5]
vec7b<-vec7[-3]
vec7b
vec2w<-c(5,6,7,8,9)
vec2w
vec8<-c(1E-3,1E4)
log(vec8)
E-3 je 0.001 E4 je 10000 E je 10 na nes
log(vec8,base=10)
log10(vec8)
exp(vec8)
exp(vec1)
vec9<-c(21,22,19,25,28,32,23.5)
vec9
cut_vec9<-cut(vec9,breaks=3)
cut_vec9<-cut(vec9,breaks=3,right=T)
vec9
cut_vec9
cut_vec9<-cut(vec9,breaks=3,right=T)
cut_vec9<-cut(vec9,breaks=3,right=F)
cut_vec9
T ima zagrade ( pa ], a F zamjeni zagrade

vec10<-c(2:5)
vec10
c_vec10<-cut(vec10,breaks=2)ut
vec10
cut_vec10
cut_vec10<-cut(vec10,breaks=2, labels=c("group 1","group 2"))
cut_vec10
print("group 1")
vec10
split_vector<-c(0,2,4,6)
split_vector
split_vec10<-cut(vec10,breaks=split_vector)
vec10
split_vec10

category<-cut(vec10, 
              breaks=split_vector,
              labels=c("first","second","third"),
              ordered_result=F)
category
vec10
split_vector
print("second")

text_vec<-"chemometrics,is,cool"
text_vec
strsplit(text_vec,",")
gene<-'ATGCTGUUAGCTUGT'
gene
stopcodon<-'UAG'
stopcodon
strsplit(gene,stopcodon)

polypeptides<-strsplit(gene,stopcodon)
polypeptides

gene2<-paste0(gene,stopcodon)
gene2

zadatak
ages<-c(21,25,29,33,40,43,55,65,70,79)
ages
splitages<-c(0,30,31,60,61)
splitages
splitages<-cut(ages,breaks=splitages)
splitages
ages
splitages

sages<-cut(ages,breaks=3)
sages

treba
agegroups<-cut(ages, breaks=c(0,30,60,i)
               labels=c('young','middle',elderly))
agegroups
agegroups<-cut(ages, breaks=c(0,30,60,Inf),
               labels=c('young','middle','elderly'))
agegroups
ages
agegroups<-cut(ages, breaks=c(0,30,60,Inf),
               labels=c('young(0-30)','middle(31-60)','elderly(61+)'))


lists
veca<-c(1,2,3,4,5,6,7,8,9)
veca
vecb<-c("severe","mild","control")
vecb
vecc<-as.factor(c("severe","mild","control"))
vecc

listvec<-list(veca,vecb,vecc)
listvec  
listvec[1]
listvec
listvec[1]<-NULL
listvec  
length(listvec)


firtspart<-listvec[c(1,3)]
firtspart

secondpart<-listvec[c(2,3)]
secondpart



matrix =tablica

vec11<-c(1:10)
vec11
mat<-matrix(vec11,ncol=5,nrow=2)
mat<-matrix(vec11,ncol=5,nrow=2)
> mat

mat<-matrix(vec11,5,2)
mat
mat<-matrix(vec11,2,5)
mat
mat2<-matrix(vec11,nrow=4,ncol=2)ne jer je 10 N
mat2<-matrix(vec11,nrow=1,ncol=10)
mat2

View(mat) - otvori novi script s tablicom
View(mat2)

mat
mat[2,2]
mat[2,1:5] ne možeš obrnuto jer nemas isti broj row,col
mat[c(2),(2:5)] tu još

rownames(mat)<-c("a","b")
mat
colnames(mat)<-c("a","b","c","d","e")
mat




2.dio

functions
suma<-function(x,y){
  zbroj<-x+y
  return(zbroj) 
  }
suma(1,2)
suma(5,-7)

a<-(1)
a
b<-(3)
b
c<-(5)
c
oduzimanje<-function (a,b,c) {
  oduzimanje<-a-b-c
  return(oduzimanje)
}
oduzimanje

p1<-oduzimanje(9,7,2)
p1
p2<-oduzimanje(10,3,3)
p2

logsuma<-function(val1,val2){
  zbroj<-log10(val1)+log10(val2)
  return(zbroj)
}
logsuma
p3<-logsuma(2,5)
p3


ph<-function(a,b){
  zbroj<--log10(a)+-log10(b)
  return(zbroj) krivo
}
ph
p4<-ph(7,2)
p4

ph<-function(konc){
  phvri<- -log10(konc)
  return(phvri)
}
ph
ph(0.002)
ph(3E-5)


toxic
toxicunit<-function(conc,ac50){
  tu<-conc/ac50
  ltu<-log10(tu)
  return(ltu)
}
pt<-toxicunit(0.005,0.01)
pt

conc<-0.005
ac50<-0.01
p5<-toxicunit(conc,ac50)
p5


savaspojevi<-c(0.01,0.002,0.0005)
savaspojevi
ac50<-c(0.34,1.5,0.001)
ac50
 
p6<-toxicunit(savaspojevi,ac50)
p6


bmi1<-function(m,v){
  bmi2<-m/v**2
  if(bmi2<25){
    bmi3<-'good'
  }else{
    bmi3<-'could be better'
  }
  return(c(bmi2,bmi3))
}
p7<-bmi1(76,1.83)  
p7
p8<-bmi1(52,1.57)
p8
p9<-bmi1(100,1.66)
p9
bmi1<-function(m,v){ova
  bmi2<-m/v**2
  if(bmi2<25){tu ako je toliko onda dobro
    bmi3<-'good'
  tu}else{ jer ako ne nap
    bmi3<-'could be better' i završi
  }jer
  return(c(bmi2,bmi3))
}ova


ph1<-function(konc){
  bmi2<-m/v**2
  if(bmi2<25){
    bmi3<-'good'
  }else{
    bmi3<-'could be better'
  }
  return(c(bmi2,bmi3))
}

ph1<-function(konc){
  ph1<- -log10(konc)
  if(ph1<7){
    ph1<-'acid'
  }else{
    ph1<-'alkaline'
  }
  return(ph1)
}
zaš neće alkalno
pp<-ph1(0.05)
pp
ppp<-ph1(2)
ppp


packages
install.packages("tidyverse")
library("tidyverse")

stopifnot(getRversion()>="4.1.0")?
  
getRversion()  4.3.3.

vec1<-c(1,2,3,4,5,6,7,8,9)
vec2<-c(T,F,F,T,F,F,F,T,T)
vec3<-sqrt(vec1**2)  

data.frame(vec1,vec2,vec3) nap tablicu tih 3 vectora u stupcima

df1<-data.frame(vec1,vec2,vec3)
df1

df2<-data.frame(yes_no=vec2,pac=vec3)
df2

View(df2)
view(df2) samo s tidyverse.pac
view(df1)

write.table(x=df2,
            file="pokusaj.txt",
            row.names=F,
            col.names=T,
            sep=";")
F ne želimo rows col smo nazavali yes, no i želimo
tab(/t), semicolon(;), space( ), pipe(I)
write.table - se spremilo kao txt u dokumentima na Puromycin
write.table(x=df2,
            file="pokusaj2.txt",
            row.names=F,
            col.names=T,
            sep=",")
getwd() kaže ti di se spremio file


Tablica<-read.table(file='pokusaj.txt',
                    sep=";",
                    header=T,
                    stringsAsFactors = T)
Tablica
header first row will be colomn names
strings - name, da se sve stavi u broj

df3<-read.tablica(file='data.txt',
                  sep="/t",
                  header=T,
                  stringsAsFactors=T) od prof je data, nemas u pc
ako ga imas ides na mape, desni klik, copy as path   i staviš umjesto'data'                
 ili možešumjesto file, mjesto, link?, 
 ili klik na file ( ali s read.delim(file.choose))
 
 Exel
 install.packages("readxl")
 library("readxl")
 c<-read_excel("data_iva.xlsx")
 d<-read_excel("dara_ivaxlsx",sheet="sheet_2")
 
 colSums(is.na(DF))traži
 DF<-na.omit(DF)makni
 colsums(is.na(DF)) view sta je nap 
 
 
 data expotation
 10L makne zadnjih 10 redova 
 names(DF) ili ncol, ili crow(DF) pokaže koliko imaš 