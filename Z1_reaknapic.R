#ZADATAK 1 - funkcije
##ovaj zadatak rješavala sam prema primjeru koji smo obrađivali na nastavi

my_function <- function(x,y) {
  zbroj <- log2(x) + y
  return(zbroj)
}
#napravila sam funkciju my_function koja zbraja logaritam broja x po bazi 2 i broj y

my_function(8,25)
my_function(2,-7)
#za testiranje funkcije, koristila sam gore navedene setove brojeva







#ZADATAK 2 - operacije
##obzirom na to da nisam bila upoznata sa svim funkcijama potrebnim za rješavanje ovog zadatka, koristila sam internet kao pomoć, a kao dodatni sustav provjere koristila sam opciju "?" odnosno "Help" u RStudiu

vec1 <- c(22, 9, 77, 99, 4, 17, 58, 33, 75, 61)
vec1
#napravila sam vektor vec1 koji u sebi sadrži gore navedene brojeve

?sum
sum(vec1)
#koristila sam funkciju sum() kako bi izračunala zbroj svih elemenata vektora vec1

?mean
mean(vec1)
#za računanje srednje vrijednosti, koristila sam funckiju mean()

?sd
sd(vec1)
#za računanje standardne devijacije, koristila sam funkciju sd()







#ZADATAK 3 - data frames
##kako bih si olakšala ovaj zadatak, opet sam koristila internet, kako za pomoć kod vlastitih grešaka, tako i za učinkovitiji probir traženih podataka

vec1 <- c("Felix", "Petar", "Ana", "Kristijan", "Mare", "Vladimir", "Elena", "Zoja", "Marko", "Donatela" )
vec2 <- c(16, 17, 17, 20, 18, 19, 19, 16, 18, 18)
vec3 <- c(8, 7, 3, 10, 5, 1, 9, 6, 2, 10)
#za početak sam napravila 3 vektora; vec1 je sadržavao imena 10 studenata (koja je bilo potrebno staviti pod navodnike), vec2 njihovu dob, a vec3 ocjenu koju su ostvarili na ispitu

data.frame(vec1, vec2, vec3)
#ova 3 vektora sam ukomponirala u jedan data frame 

df_students <- data.frame(Name = vec1, Age = vec2, Grade = vec3)
df_students
#svakom sam vektoru dodijelila naziv kategorije koju predstavlja i napravila df_students data frame



df_students$Passed <- ifelse(df_students$Grade > 5, "True", "False")
?`$`
print(df_students)
df_students
#nakon toga trebalo je dodati 4. kategoriju "Passed" koja određuje prolaznost studenta bazirano na njegovoj ocjeni (kategorija "Grade")
#za ovaj konkretan zadatak sam najviše istraživala moguće opcije na internetu te sam odlučila koristiti operator $
#pomoću njega, dodala sam novi stupac pod nazivom "Passed", a koristila sam i funkciju ifelse da u tom stupcu dodijeli "True" osobama s ocjenom većom od 5 (tj. onima koji su prošli ispit), odnosno u protivnome "False"
#za provjeru napravljenog koristim print(df_students) ili samo df_students



passed_students <- subset(df_students, Passed == "True")
print(passed_students)
#kako bih izdvojila studente koji su prošli, koristila sam funkciju subset(), čija je poanta izdvajanje određenih podskupova podataka
#budući da sam dobila opet jedan data frame koji je uključivao i ostale podatke osim imena studenata koji su prošli, bilo je potrebno napraviti još jedan korak
#napomena: izdvajanje je moguće pomoću operatora $ i nekih drugih metoda

passed_names <- passed_students$Name
passed_names
#na ovaj sam način izdvojila samo imena studenata koji su prošli (opet koristeći operator $)



passed_students_18 <- subset(df_students, Passed == "True" & Age > 18)
passed_students_18
#na identičan sam način napravila probir studenata koji su prošli ispit, a stariji su od 18 godina
#također, koristila sam operator & da uključim2 uvjeta koji moraju vrijediti za filtriranje

passed_names_18 <-passed_students_18$Name
passed_names_18
#kao što je prethodno opisano, na ovaj sam način izvukla isključivo imena studenata



mean_passed <- mean(passed_students$Age)
mean_passed
#za računanje prosječne dobi studenata koji su prošli ispit, opet sam koristila mean() funkciju
#koristila sam subset koji sam prethodno napravila

failed_students <- subset(df_students, Passed == "False")
failed_students
mean_failed <- mean(failed_students$Age)
mean_failed
#prije računanja prosječne dobi studenata koji nisu prošli ispit prvo sam napravila subset (kao što je već objašnjeno)


  