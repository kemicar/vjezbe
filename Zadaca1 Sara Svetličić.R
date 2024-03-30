#task1 functions
#napravila sam funkciju koja računa maksimalan broj otkucaja srca (Maximum Heart Rate)
#x = faktor promjene koji se povezuje s godinama
#x za muškarce iznosi 0.67, a za žene 0.88
#y = broj godina

my_func <- function(x, y){
  MHR <- 206 - (x * y)
  return(MHR)
} 

primjer1 <- my_func(0.67, 27)
primjer1

primjer2 <- my_func(0.88, 62)
primjer2


#task2 vectors
#napravila sam vektor od 10 brojeva
#izračunala sam zbroj svih elemenata vektora, srednju vrijednost i standardnu devijaciju vektora

vec1 <- c(2, 5, 8, 12, 33, 45, 64, 87, 91, 102)

zbroj <- sum(vec1)
zbroj

srednja_vrijednost <- mean(vec1)
srednja_vrijednost

st_dev <- stats::sd(vec1)
st_dev


#task3 matrices and data frames
#napravila sam vektore name, age (16-20) i grade (1-10)
#svi vektori sadrže 10 podataka (za 10 studenata)
#zatim sam napravila data frame df_students koji se sastoji od ova 3 vektora

name <- c("Iva", "Iris", "Barbara", "Laura", "Andrea", "Marko", "Mateo", "Filip", "Luka", "Matija")
age <- c(16, 18, 20, 17, 19, 17, 20, 18, 15, 16)
grade <- c(3, 7, 8, 6, 2, 9, 2, 3, 10, 6)
df_students <- data.frame(name, age, grade)
df_students

#napravila sam još jedan vektor passed (T/F) koji označava jesu li studenti položili ispit
#položili su ako im je ocjena veća od 5
#zatim sam vektor passed dodala u data frame df_students

passed <- c(F, T, T, T, F, T, F, F, T, T)
df_students <- data.frame(name, age, grade, passed)
df_students

#izdvojila sam imena učenika koji su položili
#to sam napravila preko naredbe da mi se ispišu samo imena učenika pored kojih je T

names_of_students_who_passed <- name[c(F, T, T, T, F, T, F, F, T, T)]
names_of_students_who_passed

#zatim sam od studenata koji su položili, izdvojila one koji su stariji od 18
#to sam napravila na isti princip kao u prethodnom primjeru

names_of_students_who_passed_and_are_older_than_18 <- names_of_students_who_passed[c(T, T, F, F, F, F)]
names_of_students_who_passed_and_are_older_than_18

#izračunala sam prosječnu starost učenika koji su položili i koji su pali
#to sam napravila preko naredbe mean(age)
#pomoću T/F sam odredila s kojim vrijednostima se treba/ne treba računati prosječna starost

average_age_of_students_who_passed <- mean(age[c(F, T, T, T, F, T, F, F, T, T)])
average_age_of_students_who_passed

average_age_of_students_who_failed <- mean(age[c(T, F, F, F, T, F, T, T, F, F)])
average_age_of_students_who_failed
