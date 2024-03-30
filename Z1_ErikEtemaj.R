####Z1####
################################################################################
##TASK1##

#function that multiplies two numbers

my_func <- function(x,y){ #određivanje funckije
  umnozak <- x*y #određivanje što će funckija raditi kada joj se zadaju x i y
  return(umnozak)
}
my_func(1,2)
my_func(-12,18)

################################################################################
##TASK2##

vct <- c(0,1,-2,4,5,9,17,-53,34,66) #vektor koji sadrži 10 brojeva
sum(vct) #naredba za izračun zbroja svih elemenata u vektoru
mean(vct) #naredba za izračun srednje vrijednosti elemanata u vektoru
sd(vct) #naredba za izračun standardne devijacije elemanata u vektoru

################################################################################
##TASK3##

#creating a data frame with three columns 

#određivanje 3 vektora jednake duljine koji će biti dio data framea, odnosno 3 stupca
name <- c("St1","St2","St3","St4","St5","St6","St7","St8","St9","St10")
age <- c(16,20,17,19,18,18,19,17,20,16)
grade <- c(10,10,6,6,7,7,4,2,8,9)

df_students <- data.frame(name,age,grade) #izrada data framea
View(df_students) #otvaranje df u novom tabu u RStudiju


#adding a new column which indicates who passed

passed <- c(T,T,T,T,T,T,F,F,T,T) #novi vektor koji će određivati koji student je prošao
df_studentsPassed <- data.frame(name,age,grade,passed) #izrada df sa novim vektorom
View(df_studentsPassed) #otvaranje df u novom tabu


#extracting the names of the students who passed

subset.data.frame(df_studentsPassed, grade>5) #filtriranje podataka iz df kako bi dobio samo studente koji su položili ispit
df_namesPassed <- subset.data.frame(df_studentsPassed, grade>5) #izrada novog df sa filitriranim podacima
View(df_namesPassed) #otvaranje df u novom tabu
df_namesPassed$name #lista imena studenata koji su položili


#filtering students who passed the exam and are older than 18

df_18passed <- subset.data.frame(df_namesPassed,age>18) #filtriranje podataka iz df kako bi dobio studente starije od 18, a da su položili ispit
View(df_18passed)
df_18passed$name #lista studenata iznad 18 sa položenim ispitom


#calculating the average of students who passed and who failed

mean_gradePass <- mean(subset(df_studentsPassed, passed == T)$grade) 
mean_gradePass

#izračun srednje vrijednosti na način da se filtriraju studenti koji su prošli ispit

mean_gradeFail <- mean(subset(df_studentsPassed, passed == F)$grade) 
mean_gradeFail

#izračun srednje vrijednosti na način da se filtriraju studenti koji su pali ispit

#za izradu ove zadaće sam sam proučavao sadržaje i materijale, uz korištenje skripti za vježbi