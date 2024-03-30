#TASK 1: Creating a function which divides two numbers
my_func <- function(x,y){ 
  division <- x/y 
  return(division) 
}
my_func(10,5)
my_func(1256,247)
#postavljena je funkcija koja dijeli 2 broja koja se zadaju kao argumenti my_func;
#funkcija je testirana s 2 seta brojeva

#TASK 2: Creating a vector with 10 integers and calculating sum, mean value and standard deviation of that vector
vecA <- c(12,0.34,-17,125.3,-0.5,66,53,167,42,7.77)
sum(vecA)
mean(vecA)
sd(vecA)
#prvo je kreiran vektor koji sadrži 10 elemenata, zatim su upotrebljene naredbe za izračun zbroja vektora (sum),
#srednje vrijednosti (mean) i standardne devijacije (sd)

#TASK 3: Data frames and matrices
#creating a data frame with 3 columns
name <- c("Ana","Petar","Luka","Marino","Ivan","Sandra","Tina","Maja","Tino","Anja")
age <- c(17,16,18,17,16,16,19,18,17,18)
grade <- c(7,3,2,9,4,10,10,8,5,2)
df_students <- data.frame(name,age,grade)
View(df_students)
#prvo su kreairana 3 vektora u kojima su ručno uneseni podatci (svaki vektor sadrži 10 elemenata)
#zatim je kreiran data frame koji sadrži ta 3 vektora naredbom data.frame te su po redu elementi u svakom vektoru pridruženi elementima druga 2 vektora

#adding a new column
df_students$passed <- ifelse(df_students$grade>5,T,F)
View(df_students)
#dodan je novi stupac "passed" ifelse naredbom s argumentom da ako je ocjena viša od 5 onda je točno da je student položio, a ako nije onda je netočno

#extracting the names of students who passed
passed_students <- subset(df_students, passed == T)
passed_students$name
#naredbom subset izdvojeni su studenti koji su položili; operatorom $ izdvojena su imena tih studenata

#extracting the names of students who passed and are older than 18
passed_students_of_age <- subset(df_students, passed == T & age>18)
passed_students_of_age$name
#na isti način kao i prethodni dio zadatka odrađeno uz operator & kako bi se dodao drugi argument za filtriranje

#average age of students who passed and who failed
mean(subset(df_students,passed == T)$age)
mean(subset(df_students,passed == F)$age)
#prosječna dob i jedne i druge skupine studenata izračunata je kombinacijom naredbi mean (za izračun srednje vrijednosti) i subset(za izdvajanje studenata koji spadaju u skupinu)
#korišten je operator $ kako bi se definiralo koje vrijednosti se uzimaju