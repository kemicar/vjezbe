vec8 <- c(1.327, 2.8973, 3.7237, 4, 5.7387) #radimo novi vektor
print (vec8)
vec8[3:5] #možemo ispisati odredene elemente vektora
vec8[3]

#takoder možemo i ukloniti odredene elemente vektora
vec8[-3]
print(vec8)
#ali da se vektor bez tog elementa spremi moramo ga ponovno unjeti
vec8b<- vec8[-3]
print(vec8b)

#vektore možemo zapisati i u obliku 10 na odredeni eksponent
vec9<-c(1E-3, 1E5)
print (vec9)
#možemo ih i logaritmirati
log(vec9)
log(vec9, base=10) #base=napišemo koju bazu želimo

#REZANJE VEKTORA
?cut #tražimo pomoc sa funkcijom
vec10<-c(21,22,19,25,28,32,23.5)
print(vec10)

cut_vec10<-cut(vec10, breaks=3) #vektor režemo u 3 sekcije
cut_vec10
vec10

#odredene zagrade predstavljaju hoce li neki broj biti ukljucen ili ne npr (a,b) brojevi nisu ukljuceni dok [a,b] brojevi su ukljuceni

cut_vec10<-cut(vec10,breaks=4, right=T)
cut_vec10
cut_vec10<-cut(vec10,breaks=4, right=F)
cut_vec10

vec11<-c(2:5)
vec11
cut_vec11<-cut(vec11, breaks=2)
vec11
print(cut_vec11)

#rezanim dijelovima možemo dodati i labels
cut_vec11<-cut(vec11, breaks=2, labels=c("Group1", "Group2"))
print(cut_vec11)
print(vec11)

#NOVO!! - SPLITANJE
split_vector <- c(0,2,4,6)
split_vector
split_vec10 <- cut(vec10, breaks=split_vector)
split_vec10

category <- cut(vec10,
                breaks = split_vector,
                labels = c("first","second","third"),
                ordered_result = T)

#isto možemo i sa F

print(category)

#razdvajanje teksta
text_vec<-'Lijep i suncan dan'
strsplit(text_vec)
strsplit(text_vec, ',')


gene<-'ATGCTUUAGCTUGT'
stopcodon<-'UAG'
strsplit(gene, stopcodon) # napravili smo novi gen bez stop kodona - izrezali smo ga
polipeptid<-strsplit(gene,stopcodon) #stopkodon koji smo izrezali možemo i vratiti
polipeptid

#ZADATAK - GODINE
ages<-c(1,15,22,39,41,55,67,74,84,90,95)
age_gropus<-cut(ages, breaks = c(0, 30, 60, Inf),
            labels = c('Young', 'Middle-aged','Elderly'))
age_gropus

#NOVO - LISTE!
vec1 <- c(1,2,3,4,5,6,7,8,9)
vec3 <- c("severe","mild","control")
vec4 <- as.factor(c("severe","mild","control"))
list_vec <- list(vec3,vec4,vec1)
list_vec
list_vec[2] # pokazuje nam samo odredeni element liste
lenght(list_vec) #pokazuje duljinu liste

#ako želimo ukloniti odredeni dio liste radimo to s ovom naredbom
list_vec[1]<-NULL
length(list_vec) #opet provjeravamo duljinu

list_vec<-list(vec12,vec13,vec14)
list_vec
first_part<-list_vec[1:2] #možemo se igrati s time koji dio liste želimo pokazati
second_part<-list_vec[3]
first_part
second_part

#U PRAGRAMU R MOŽEMO RADITI I MATRICE
vec15<-c(1:10)
mat<-matrix(vec15, ncol = 5,nrow = 2)
mat
View(mat) #u novom prozoru pokazuje matricu koju smo napravili

mat[2,2] #pokazuje odredeni dio matrice koji želimo
mat
mat[1:5,2]
mat[2:1,5]

#možemo redovima i stupcima matrica promijeniti nazive
colnames(mat)<-c("a","b", "c","d","f")
rownames(mat)<-c("a","b")
mat
View(mat) # ako ostavimo samo "" nece se promijeniti ime tog reda/stupca

#ASISTENTICA IVA - FUNKCIJE

suma <- function(x, y){
  zbroj <- x + y
  return(zbroj)
}

suma(1,2)
suma(5,-7)  #ZBRAJANJE

#SAMOSTALNI ZADATAK! 
oduzimanje <- function(x,y,z){
  oduzmi <- x-y-z
  return(oduzmi)
}
primjer1<-oduzimanje(10,1,1)
print(primjer1) # TOCNO!! radi


logsuma <- function(val1,val2){       #možemo raditi razne funkcije poput logaritma
  zbroj <- log10(val1)+log10(val2)
  return(zbroj)
}
logsuma(1,2)
logsuma(2,5)
primjer2 <- logsuma(2,5)
primjer2

#SAMOSTALNI ZADATAK!!
pH_zadatak<- function(konc){
  ph_racun <- -log10(konc)
  return(ph_racun)
}

pH_zadatak(3)
pH_zadatak(0.5) #RADI!!

toxic_unit <- function(conc, ac50){
  tu <- conc/ac50
  ltu <- log10(tu)
  return(ltu)
}

primjer3 <- toxic_unit(0.005,0.01)
primjer3

#možemo umjesto da pišemo posebno naredbe samo navesti vrijednost koncentracije i ac50 - isto radi

concentration <- 0.005
ac50 <- 0.01
primjer4 <- toxic_unit(concentration, ac50)
primjer4

#možemo uvesti vektore - raditi s voše brojeva
sava_spojevi <- c(0.01, 0.002, 0.005)
ac50 <- c(0.34,1.5,0.001)
primjer5 <- toxic_unit(sava_spojevi,ac50)
primjer5

#ZADATAK SA BMI - IF - ELSE?

bmi_classifier <- function(m,v){    #masa,visina 
  bmi_calc <- m/v**2
  
  if(bmi_calc<25){
    bmi_class <- "super"     #ako je manje od 25 napiši super
  }else{
    bmi_class <- "lose"}  #ako nije napiši lose
  
  return(c(bmi_calc, bmi_class))
 }
primjer6 <- bmi_classifier(70,1.74)
primjer6

bmi_odredivanje <- function(m,v){
  bmi_izracun <- m/v**2
  if (bmi_izracun <25){
    bmi_class <- 'Good'
  } else{
    bmi_class <- 'Could be better'
  }
  return(c(bmi_odredivanje,bmi_class))
}
primjer7 <- bmi_odredivanje(76,1.83)
primjer7

#SAMOSTALNI ZADATAK PH!

pH_zadatak <- function(konc){
  pH_racun <- -log10(conc1)
  
  if(zbroj < 7){        #uvjetujemo
    ph <- "kiselo"
  }else{
    ph <- "luznato"
  }
  return(c(ph_racun, ph))
}
pH_racun(10)
pH_racun(0.001) #RADI

#PAKETI U RS STUDIJU - treba instalirati!
#install.packages("tidyverse")
#library("tidyverse")
#instalirala sam paket i onda mi se zablokiralo racunalo morala sam otvoriti drugi RS studio

#NOVI RS
vec1<-c(1,2,3,4,5,6,7,8,9)
vec2<-c(T,F,F,T,F,F,F,T,T)
vec3<-sqrt(vec1**2)
df1<-data.frame(vec1,vec2,vec3)
df1

# preimenujemo imena kolona
df2<-data.frame(yes_no =vec2, patient=vec3)
print(df2)
View(df2) #otvorilo je tablicu u novom prozoru

#želimo spremiti tablicu u obliku .txt
#komanda: write.table

write.table(x=df2,
            file="pokusaj.txt",
            row.names=F,
            col.names=T,
            sep=";") #tab(/ali obrnuto pa t /t), space (), pipe(ravna crta))

#stvoren je novi dokument .txt

getwd() #get working directory - fensi naziv za mapu
#tako gledamo u kojoj mapi se nalazi stvoreni dokument

#ako želimo promijeniti direktorij u kojem se nalazi -- setdw()
#kako cemo loadati .txt datoteke?

tablica<- read.table(file="pokusaj.txt",
                     sep= ";",
                     header= TRUE, #prvu kolonu želimo kao names
                     stringsAsFactors=T) #traformira sve brojeve u valiues
                     
View(tablica)

#na dalje samo pratimo asistenticu Ivu zbog toga što nedostaje jedan file pa ne možemo skupa raditi
#možemo ocitati tablice i sa internera, aisistentica nam je pokazala kako otvoriti .txt datoteke iz direktorija i sa weba

#možemo otvoriti i klikanjem, ali se ne preporucuje
#View(my_data) - pa se klikanjem otvori

#možemo otvoriti i exel tablice
#install.packages("readxl") pa zatim libary("readxl")

#kada imamo instaliran paket loadamo s naredbom
c<- read_excel("data_iva.xlxs") # stavimo ime dadoteke koju želimo otvoriti

#ako želimo otvoriti neki drugiu list u excelu osim prvog pozivamo pomocu komande
d<- read.excel("data_iva.xlxs", sheet="sheet_2")
View(d)

#exel može otvoriti i prazne tablice što može biti problem jer ce se izbacivati error
#moramo tražiti NV - rupe i maknuti ih

colSums(is.na(DF)) #tražimo sve Nan values
DF <- na.omit(DF)
colSums(is.na.DF)??? # bilo je prebrzo
  
#LOADANJE DATA SETOVA

head(DF) #pokazuje nam prvi dio tablice
tail(DF) #pokazuje zadnjih 6 redova

head(DF, n=2L) # želimo vidjeti odredeni red
#isto napravimo i za rep

#ako želimo vidjeti broj redova ili kolona
ncol(DF)
nrow(DF)

#ako želimo vidjeti sve vrijednosti u nekom redu
DF$visina [2:10]
#moguce razne varijacije



                     

