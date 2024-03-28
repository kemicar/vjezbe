vec7 <-c(1.237, 2.944, 3, 4, 5.5222)
print(vec7)
vec7[3]
vec[3:5]

vec7[-3]
print(vec7)
vec7b <- vec7[-3]
vec7b
vec7[-2]
vec7x <- vec7[-2]
print(vec7x)
vec7x[1:3]
##eksponenti
vec8 <- c(1E-3, 1E4)
print(vec8)
##prirodni logaritam
log(vec8)
##logaritam s drugim bazama
log10(vec8)
log(vec8, base = 8)
##eksponencionalna funkcija
exp(vec8)
##cut kategorizira elemente vektora
vec9<-c(21,22,19,25,28,32,23.5)
cut_vec9 <- cut(vec9, breaks=3)
cut_vec9
##customize interval=funkcija right
?cut
cut_vec9 <- cut(vec9, breaks=3, right=T)
cut_vec9
vec91 <- c(14, 16, 15, 23)
vec91
cut_vec91 <- cut(vec91, breaks=2)
cut_vec91
cut_vec91 <- cut(vec91, breaks=2, right=F)
cut_vec91
cut_vec91 <- cut(vec91, breaks =3, right = F)
cut_vec91
###kreiramo vektor s brojevima od 2 do 5
vec10 <- c(2:5)
vec10
cut_vec10 <- cut(vec10, breaks =2)
cut_vec10
cut_vec10 <- cut(vec10, breaks=2, labels = c("Group1", "Group2"))
print(cut_vec10)
vec10
##split vector
vec10
split_vector <- c (0,2,4,6)
split_vector
split_vec10 <- cut(vec10, breaks = split_vector)
vec10
split_vec10
##stavljamo labels
category <- cut(vec10,
                breaks = split_vector,
                labels = c('first', 'second', 'third'),
                ordered_result = T)
category
?cut
##text vektori - dijelimo rijeci na temelju zareza
text_vec <- 'Nista, kontra, Splita'
strsplit(text_vec, ',')
###splitamo dva vektora medusobno
gene <- 'ATGCTGUUAGCTUGT'
stopcodon <- 'UAG'
strsplit(gene, stopcodon)
##stavit cemo ka kao novi vektor
polypeptides <- strsplit(gene, stopcodon)
polypeptides
##zelimo nesto pasteat nazad
gene2 <- paste0(gene, stopcodon)
gene2
##TASK:
ages <- c(1,33,50,5,12,46,62,28,70,24)
ages
cut_ages <- cut(ages, breaks= c(0, 30, 60, Inf), 
                labels = c('Young(0-30)', 'Midddle-aged (31-60)', 'Elderly(61+)'))
cut_ages
##liste vektora
vec1 <- c(1,2,3,4,5,6,7,8,9)
vec3 <- c("severe", "mild", "control")
vec4 <- as.factor(c("severe", "mild", "control"))
list_vec <- list(vec3, vec4, vec1)
list_vec
##zelimo samo prvi element tj.vektor iz liste
list_vec[1]
##zelimo vidit duljinu liste tj. broj vektora u listi
length(list_vec)
##izbacit cemo element tj.vektor iz liste
list_vec[1]
list_vec[1] <- NULL
list_vec
length(list_vec)
##splitamo listu u 2 dijela
list_vec <- list(vec3, vec4, vec1)
list_vec
first_part <- list_vec[1:2]
second_part <- list_vec[3]
first_part
second_part
#####Matrice
?matrix
vec11 <- c(1:10)
mat <- matrix(vec11, ncol=5, nrow=2)
mat
##prvo ide row, pa onda coloumn ako ne pisemo nrow ni ncol nego samo brojeve
mat_2 <- matrix (vec11, 2, 5)
View(mat_2) ##pokazat ce nam matricu u novom prozoru
print (mat_2)
##trazimo elemente u odredenom redu i odredenom stupcu, prvo row pa column
mat[2,2]
mat[1,5]
mat[1:5,2]
mat[2, 1:5]
mat[c(2,5),2]
mat[2, c(2,5)]
##mijenjamo imena rwdova i stupaca
rownames(mat)<-c("a","b")
mat
colnames(mat) <- c("c", "d", "e", "f", "g")
View(mat)

####FUNKCIJE U R
suma <- function(x,y){
  zbroj <- x + y
return (zbroj)
}
suma(1, 2)
suma(5, -7)
###oduzimanje funkcija
oduzimanje <- function(x, y, z){
  razlika <- x +(- y)+ (- z)
return (razlika)
}
oduzimanje (1,3,5)
oduzimanje (1,-3,-5)
###zbrajanje logaritama s bazom 10 u obliku funkcije
logsuma <- function(val1, val2){
  zbroj <- log10(val1) + log10(val2)
  return(zbroj)
}
primjer3 <- logsuma(2,5)
primjer3
####TASK 2: ph 
#pH=-log10[H]
pH <- function(H){
  zbroj <- -log10(H)
  return(zbroj)
}
primjer5 <- pH(0.002)
primjer5
primjer6 <- pH(3E-5)
primjer6
###Toxic unit
toxic_unit <- function(conc, ac50){
  tu <- conc/ac50
  ltu <- log10(tu)
  return(ltu)
}
primjer4 <- toxic_unit(0.005,0.01)
primjer4
concentration <- 0.005
ac50 <- 0.01
primjer5 <- toxic_unit(concentration, ac50)
primjer5
##mozemo to sve i s vektorima radit
sava_spojevi <- c(0.01, 0.002, 0.0005)
ac <- c(0.34, 1.5, 0.001)
primjer6 <- toxic_unit(sava_spojevi, ac50)
primjer6
toxic_unit <- function(conc, ac50){
  tu <-  conc/ac50
  ltu <- log10(tu)
  return(ltu)
}
sava_spojevi <- c(0.01, 0.002, 0.0005)
ac <- c(0.34, 1.5, 0.001)
primjer6 <- toxic_unit(sava_spojevi, ac50)
primjer6
##3 if i else, BMI primjer
bmi_classifier <- function (m, v){
  bmi_calculation <- m/v**2
  if(bmi_calculation <25){
    bmi_class <- 'Good'
  } else {
    bmi_class <- 'Could be better'
  }
  return(c(bmi_calculation, bmi_class))
}
primjer7 <- bmi_classifier(80, 1.63)
primjer7
pH <- function(H){
  zbroj <- -log10(H)
  if(zbroj < 7){
    pH_vrij <- 'Acid'
  }else{
    pH_vrij <- 'Alkaline'
  }
  return(c(zbroj, pH_vrij))
}
primjer9 <- pH(0.002)
primjer9
ph <- function(konc) {
  ph_vrijednost <- -log10(konc)
  if (ph_vrijednost < 7){
    ph_klasa <- "acid"
  } else {
    ph_klasa <- "alkaline"
  }
  return(c(ph_vrijednost, ph_klasa))
}
install.packages("tidyverse")
stopifnot(require('tidyverse'))
getRversion()
##dataframes (vektori moraju biti jednako dugi)
vec1 <- c(1,2,3,4,5,6,7,8,9)
vec2 <- c(T,F,F,T,F,F,F,T,T)
vec3 <- sqrt(vec1**2)
data.frame(vec1, vec2, vec3)
vec4 <- c('a','b','c','d','e','f','g','h','i')
data.frame(vec1, vec2, vec4)
df1 <- data.frame (vec1, vec2, vec3)
df1
df2 <- data.frame (yes_no = vec2, patient =vec3)
df2
View(df2)
##pribacujemo tablicu u .txt
write.table(x = df2,
            file = "pokusaj.txt",
            row.names = F,
            col.names = T,
            sep = ";")
getwd()
###load text file
tablica <- read.table(file = 'pokusaj.txt',
                      sep = ";",
                      header = TRUE,
                      stringsAsFactors = T)
View(tablica)
