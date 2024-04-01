#zadatak 1.

my.function <- function(br1, br2) {
  rezultat <- (br1*br2)/br1+br2
  return(rezultat)
}
rezultat1 <- my.function(9,3)
rezultat1
rezultat2 <- my.function(5,7)
rezultat2

  #Prvo sam napisala funkciju koja se zove my.function i zadala joj da se sastoji od 
  # argumenata br1 i br2,te sam napisala da želim da mi se izračuna rezultat  
  # od (br1*br2)/br1+br2 i napisala sam da mi se vrati taj izračunati rezultat.
  # Kako bi testirala svojoj funkciji mx.function sam dodala brojeve 9 i 3 ispremila sam to pod 
  # nazivom varijable rezultat1 i na kraju sam ponovno napisala rezultat1 kako bi mi se ispisalo rješenje


#zadatak 2.

vec <- c(58,66,65,23,17,12,8,1,45,37)

zbroj <- sum(vec)
zbroj
srednja.vrijednost <- mean(vec)
srednja.vrijednost
devijacija <- sd(vec)
devijacija

#napisala sam prvotno vektor koji sadrži 10 nasumično odabranih brojeva te sam napisala da želim
#da mi se zbroj vrijednosti vektora koristeći funkciju sum() spremi pod zbroj, zatima da se srednja vrijednost dobivena korisreći funkciju  mean() 
#vektora spremi pod srednja.vrijednost, te srednja devijacija koristeći funkciju sd() spremi pod devijacija i na kraju sam ispisala rezultate


#zadatak 3.
?data.frame()

df_students <- data.frame(Name = c("Ivan","Martina","Snježana","Ivona","Toni","Robi","Ana","Lovro","Iva","Domo"),
  Age = c(20 , 17 , 19 , 18 , 20 , 16 , 19 , 17 , 20 , 16 ),
  Grade = c(2,10,5,9,6,4,7,2,2,3)
)
####Za napraviti data frame korsitila sam naredbu data.frame() i unutar zafrade sam napisala nazive
####stupaca s njihovim vrijednostima


?transform.data.frame
df_students <- transform.data.frame(df_students, Passed= Grade>5)

####Za dodati novi stupac korsitila sam transform.data.frame() i zadala sam da ocjene budu iznad 5 i da pokaze koji su studenti pali koji prosli


passed_students <- subset.data.frame(df_students,Passed==TRUE, select = Name)
##za izdvojit studente koji su prošli koristila sam subset.data.frame() iz data frama df_student
## na temelju uvjeta da su studenti imali ocjenu višu od 5 dnosno da je TRUE i da se prikažu imena dodali smo select=Name


filter <- subset.data.frame(df_students, Age>18 & Passed==TRUE)
filter

##Za filtrirat studente koristila sam opet subset.data.frame i kao uvjet dodala sam da godine moraju biti iznad 18 i da test mora biti položen

passed_age <-  mean(subset.data.frame(df_students, Passed== TRUE)$Age)
passed_age
failed_age <- mean(subset.data.frame(df_students, Passed== FALSE)$Age)
failed_age

##za izračunat srednju vrijednost koristila sam mean() koji služi za izračunavanje srednje vrijednosti godina u zadatku i uvijet da su studenti prošli ili pali 