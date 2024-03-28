vec7 <- c(1.237, 2.944, 3,4,5.5222)








vec8 <- c(1E-3, 1E4)
print(vec8)

log(vec8)
log10(vec8)
log(vec8,base=10)

exp(vec8)


vec9 <- c(21,22,19,25,28,32,23,5)
cut_vec9 <- cut(vec9, breaks = 3)
cut_vec9

cut_vec9 <- cut(vec9, breaks = 3, right = F)
cut_vec9
cut_vec9 <- cut(vec9, breaks = 3, right = T)
cut_vec9

cut_vec9 <- cut(vec9, breaks = 4, right = F)
cut_vec9



vec10 <- c(2:5)
cut_vec10 <- cut(vec10, breaks =2)
print(cut_vec10)

cut_vec10 <- cut(vec10, breaks =2, labels = c("group1","group2"))
print(cut_vec10)




split_vector <- c(0,2,4,6)
split_vec10 <- cut(vec10, breaks=split_vector)
split_vec10



category <- cut(vec10, 
                breaks = split_vector,
                labels=c("prvi","drugi","treći"),
                ordered_result = F)
print(category)

category <- cut(vec10, 
                breaks = split_vector,
                labels=c("prvi","drugi","treći"),
                ordered_result = T)
print(category)


text_vec <- "kemometrija, je, super"
strsplit(text_vec,",")

gene <- "ATGCTGUUAGCTUGT"
stopkod <- "UAG"

strsplit(gene, stopkod)



polipeptidi <- strsplit(gene, stopkod)
polipeptidi




gene2 <- paste0(gene, stopkod)
gene2



#zadatak
ages <- c(10,23,48,78,76,55,32,15,45,39)
split_vec123 <- c(0,30,60,Inf)
age_groups <- cut(ages, 
                breaks = split_vec123,
                labels = c("young","middle","elderly"))
age_groups
ages




#liste
vec1 <- c(1,2,3,4,5,6,7,8,9)
vec3 <- c("severe","mild","control")
vec4 <- as.factor(c("severe","mild","control"))

list_vec <- list(vec3,vec4,vec1)
print(list_vec)


list_vec[ 2]
length(list_vec)

list_vec[ 1]
list_vec[ 1] <- NULL
length(list_vec)

list_vec <- list(vec3,vec4,vec1)
first_part <- list_vec[ 1:2]
second_part <- list_vec[ 3]

first_part
second_part

#matrice
vec11 <- c(1:10)
mat <- matrix(vec11,ncol = 5,nrow = 2)
mat
#View u novu karticu otvori

mat[2, 2]
mat[1:2, 5]
mat[ 2, 1:5]
mat[ c(2,1),5]



View(mat)

colnames(mat)<-c("a","b","c","d","e")
mat

rownames(mat) <- c("1","2")
mat
View(mat)



suma <- function(x,y){
  zbroj <- x + y
  return(zbroj)
}
suma(1,2)

oduzimanje <- function(x,y,z)
  {
  zbroj <- x -y -z
  return( zbroj )
}
oduzimanje(23,4,5)

logsum <- function(val1,val2)
  {
  zbroj <- log10(val1) + log10(val2)
  return(zbroj)
} 
primjer <- logsum(2,5)  
primjer  

ph <- function(konc){
  ph_vrijednost <- -log10(konc)
  return(ph_vrijednost)
}
ph(0.002)  


toxic_unit <- function(conc, ac50){
  tu <- conc/ac50
  ltu <- log10(tu)
  return(ltu)
}

bmi_classifier <- function(n,v){
  bmi_calculation <- n/v**2
  if (bmi_calculation < 25){
    bmi_class <- "good"}
  else {
    bmi_class <- "could be better"
  }
  return(c(bmi_calculation,bmi_class))
}
primjer7 <- bmi_classifier(76,1.83)
primjer7

ph <- function(konc) {
  ph_vrijednost <- -log10(konc)
  if (ph_vrijednost < 7){
    ph_klasa <- "acid"
  } else {
    ph_klasa <- "alkaline"
  }
  return(c(ph_vrijednost, ph_klasa))
}
ph(0.002)


install.packages("tidyverse")

getRversion()

vec1
vec2 <- c(T,F,F,T,F,F,F,T,T)
Vec12 <- sqrt(vec1**vec2)

data.frame(vec1,vec2,Vec12)
df1 <- data.frame(vec1,vec2,Vec12)

df2 <- data.frame(yes_no=vec2, patient=Vec12)
print(df2)
view(df2)


write.table(x=df2,
            file= "pokusaj",
            row.names = F,
            col.names = T,
            sep=":") #comma(,), tab(/t), semicolon (;), space()
getwd()


tablica <- read.table(file="pokusaj",
                      sep = ":",
                      header = TRUE,
                      stringsAsFactors = T)

View(tablica)


