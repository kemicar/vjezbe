## Homework 1##

#Task 1#
# creating a function#
# korištena funkcija biti će osnovna operacija množenja
# funkciju sam iskoristila za izračunavanje ukupnog broja uskrsnih jaja 
# obzirom na broj košara i prosječan broj jaja u svakoj košari

# *za izradu funkcije poslužila sam se skriptom s Vježbe 2 te internetom za funkciju cat 

my_func <- function(num_baskets, avg_eggs_per_basket) {
  total_eggs <- num_baskets * avg_eggs_per_basket
  return(total_eggs)
}

# testiranje funkcije s dva seta brojeva
set1_result <- my_func(5, 12)  # 5 baskets with 12 eggs each
set2_result <- my_func(10, 8)  # 10 baskets with 8 eggs each

# Output rezultata- koristila sam funkciju 'concentrate and print' umjesto print
cat("Result of set 1:", set1_result, "\n")
cat("Result of set 2:", set2_result, "\n")


##Task 2##
# vector operations#

#najprije sam ispisala vektor sa 10 elemenata
vec1 <- c(3, 4.15, 7, 11, 33, 38, 44, 55, 60, 71)

# za izračun zbrajanja- funkcija sum
sum <- sum(vec1)
sum

#za izračun aritmetičke sredine koristila sam funkciju mean
mean_value <- mean(vec1)
mean_value

#izračun standardne devijacije izračunala sam pomoću funckije sd
standard_deviation <-sd(vec1)
standard_deviation
                  
### Task 3###
# Working with Matrices and Data Frames

#najprije kreiram tri vektora za svaku kolumnu
Name <- c("Petra", "Leon", "Neo", "Maris", "Antonia", "Jelena", "Slaven", "Eni","Teo", "Robin")
Age <- c(17, 18, 16, 17, 19, 20, 19, 18, 19, 20)
Grade <- c(9, 10, 7, 6, 5, 3, 4, 8, 10, 2)

#potom kreiram data frame sa navedenim vektorima
df_students <- data.frame(Name, Age, Grade)
df_students

#za označavanje prolaska na temelju ocjena nadodajem vektor/stupac Passed
Passed <- c('FALSE', 'TRUE', 'TRUE', 'FALSE', 'TRUE', 'TRUE', 'TRUE', 'TRUE','FALSE', 'TRUE')
df_students <- data.frame(Name, Age, Grade, Passed)

#za ispis imena/Names samo onih koji su prošli stavljajući uvjet da imaju Grade veći od 5
df_students$Name[df_students$Grade > 5]

#filtriramo imena učenika koji su stariji od 18 i položili ispit
#učenici koji su stariji od 18 godina
df_students$Name[df_students$Age > 18]
#učenici koji su položili ispit
df_students$Name[df_students$Grade > 5]
#za ispis učenika koji zadovoljavaju oba uvjeta spajam prethodno navedene funkcije
df_students$Name[df_students$Age > 18 & df_students$Grade > 5]

#krajnje, računam prosječnu dob studenata koji su prošli i nisu prošli ispit
# za izračun ovog dijela koristim funkciju subset.data.frame uz mean da naglasim
#uvjet dobi/Age i proslaska ispita/Passed

students_passed_age <- mean(subset.data.frame(df_students, Passed ==TRUE)$Age)
students_passed_age
students_failed_age <- mean(subset.data.frame(df_students, Passed == FALSE)$Age)
students_failed_age




