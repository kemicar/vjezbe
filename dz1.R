#Task 1

#odlucila sam napravit funkciju koja racuna hiptenuzu pravokutnog troguta (c) prema pitagorinom poucku

my_func <- function(a, b){  #a i b su argumenti, u mom slucaju duljine kateta
  c <- sqrt(a**2 + b**2) #pitagorina formula
  return(c) #zelim izracunat hipotenuzu, c
}

primjer1 <- my_func(2,3)
primjer1 #ili print(primjer1)

primjer2 <- my_func(4.5,7)
primjer2

#Task 2

vec1 <- c(2, 2.3, 5, 14, 15, 20.1, 20.15, 22, 30, 40) #napravila sam vektor sa 10 elemenata

sum <- sum(vec1) #koristim sum, funkciju za zbrajanje
sum

mean_value <- mean(vec1) #mean je funkcija za aritmeticku sredinu
mean_value

standard_deviation <- sd(vec1) #sd je funkcija za racunanje standardne devijacije
standard_deviation

#Task 3

#prvo cu napravit tri vektora za svaki red

Name <- c("Ana", "Borna", "Chiara", "Dora", "Erik", "Fran", "Gabriela", "Hana", "Ivan", "Jana")
Age <- c(16, 16, 20, 19, 19, 17, 16, 17, 18, 19)
Grade <- c(7, 8, 8, 6, 3, 5, 8, 10, 7, 4)

df_students <- data.frame(Name, Age, Grade) #zatim sam napravila data frame df_students
df_students

Passed <- c('TRUE', 'TRUE', 'TRUE', 'TRUE', 'FALSE', 'FALSE', 'TRUE', 'TRUE', 'TRUE', 'FALSE')  
df_students <- data.frame(Name, Age, Grade, Passed) #dodajem stupac Passed tako da redom upisujem T/F na temelju uvjeta grade>5

# (drugi nacin za dodat stupac Passed): df_students$Passed <- df_students$Grade > 5 


df_students$Name[df_students$Grade > 5] #df_students$name ispisuje cijeli stupac imena, a mi zelimo samo imena onih koji su prosli, dakle df_students$name[df_students$Grade > 5]

#zatim trebamo ispisat imena studenata koji imaju vise od 18 godina i koji su prosli ispit
#df_students$Name[df_students$Age > 18] nam ispisuje studente starije od 18
#df_students$Name[df_students$Grade > 5] nam ispisuje studente koji imaju ocjenu visu od 5 (koji su prosli) tako da cu to spojiti

df_students$Name[df_students$Age > 18 & df_students$Grade > 5]

#kako bi izracunala prosjek godina studenata koji su prosli, prvo sam kreirala age_passed i dodijelila godine onih sudenata koji su prosli
age_passed <- df_students$Age[df_students$Grade > 5]            
mean(age_passed) #onda sam izracunala srednju vrijednost od age_passed

age_failed <- df_students$Age[df_students$Grade <= 5]
mean(age_failed) #istu stvar sam napravila za prosjek godina onih koji su pali, samo je ocjena <=5

