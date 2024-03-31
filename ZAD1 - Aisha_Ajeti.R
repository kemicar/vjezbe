###TASK 1: CREATING AND USING FUNCTIONS
my_func <- function(x,y){   ##funkcija koja koristi varijable x i y kojima dajemo neku vrijednost
  umnozak <- x*y  ##funkcija umnoska jednaka nam je umnosku varijabli x i y
return(umnozak)
}
my_func(3,5) ##umjesto x i y upisujemo odredene vrijednosti
my_func(-2,3)

###TASK 2: VECTOR OPERATIONS
vec1 <- c(1,2,5,9,12,14,16,28,32,43)
sum(vec1)  ##sum sluzi za zbroj elemenata vektora
mean(vec1) ##mean odreduje srednju vrijednost vektora
sd(vec1)   ## sd funkcija odreduje standardnu devijaciju vektora

###TASK 3: WORKING WITH MATRICES AND DATA FRAMES
Name <- c('Ante','Mate','Lovre','Duje','Mare','Bepo','Cvita','Tonka','Roza','Luce') 
Age <- c(18,17,18,16,19,20,17,16,19,19)
Grade <- c(1,2,4,6,8,9,7,3,5,10)
data.frame(Name,Age,Grade)
df_students <- data.frame(Name,Age,Grade) ##napravljen data frame s vektorima Name, Age i Grade

df_students$Passed <- ifelse(df_students$Grade > 5, TRUE, FALSE) ##stvoren novi stupac 'Passed' koji izdaje TRUE ako je vrijednost u Grade veca od 5, inace izdaje FALSE.
View(df_students)

Name_passed <- df_students$Name[df_students$Passed] ##napravljena nova varijabla Name_passed koja je jednaka stupcu Name taj stupac ima vezanu vrijednost TRUE u Passed stupcu, tj ako za njega vrijedi da je Passed istina
Name_passed

Filtered_students_age_passed <- df_students$Name[df_students$Passed & df_students$Age >18] 
Filtered_students_age_passed ##Varijabla sadrzi imena iz df_students pod uvjetom da je istina da su prosli & da je vrijednost Age > 18

Average_age_passed <- mean(df_students$Age[df_students$Passed])
Average_age_passed ##pronasli smo srednju vrijednost godina studenata pod uvjetom da su prosli

failed <- df_students$Age[df_students$Passed == FALSE]
Average_age_failed <- mean(failed)
Average_age_failed ### pronadena srednja vrijednost godina studenata za koje vrijedi da je Passed = F
