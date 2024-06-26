#zadaca 1 - 29.3.2024.

#ZADATAK 1
#Creating and Using Functions

my_func<- function (l,s){   #napravila sam funkciju my_func te postavila 2 argumenta koja ce funkcija rije�avati
         zadatak<- l/s      #varijabla rezultat racunat ce kasnije upisane argumente na ovaj nacin
         return(zadatak)    #funkcija ce vratiti rezultat 
}

zadatak1<-my_func(3,3)      # unos argumenata koje ce funkcija rije�iti, ocekujem rezultat 1
print(zadatak1)             # rezultat iznosi 1 kako sam i ocekivala


zadatak2<-my_func(5.90,7.38)      # unos argumenata koje ce funkcija rije�iti, ocekujem rezultat 0.79945 (provjereno kalkulatorom)
print(zadatak2)                   # rezultat iznosi 0.799458 kako sam i ocekivala


#ZADATAK 2
#Vector Operations

vec1<-c(2,4,6,8,10,12,14,16,18,20)  #napravila sam vektor s 10 cijelih brojeva

#1) zbroj svih elemenata

?sum                               #tra�ila sam pomoc programa i vi�e informacija u vezi funkcije sum

zbroj_vektora <- sum(vec1)         #postavila sam novu varijablu zbroj_vektora koja sadr�i naredbu za zbrajanje
print(zbroj_vektora)               #naredba za prikaz rezultata varijable

#2) srednja vrijednost vektora

?mean  #prvo sam provjerila mogu li pomocu ove naredbe izracunati aritmeticku sredinu

as_vektora <- mean(vec1)        #postavila sam varijablu za aritmeticku sredinu koja ce izracunati srednju vrijednost gore zadanog vektora
print(as_vektora)               #prikaz rezultata

#3) standardna devijacija vektora

?standarddeviation #tra�ila sam pomoc programa s funkcijom, nisam bila sigurna kako glasi naredba za standardnu devijaciju pa sam poku�avala na vi�e nacina tra�iti pomoc
?deviation
?sd                #tra�ena funkcija

sd_vektora <- sd(vec1)  #nova varijabla za standardnu devijaciju gore napisanog vektora vec1
print(sd_vektora)       #prikaz rezultata

#ZADATAK 3
#Working with Matrices and Data Frames

#1) tablica s tri stupca

#prvo cu napraviti tri vektora koji ce mi se nalaziti u tablici

#vektor koji ce predstavljati kolonu "Ime"
Ime<-c("Lucija", "Veronika","Matija","Iva","Ana","Monika","Marija","Josipa","Mislav","Bruno")

#vektor koji ce predstavljati kolonu "Dob"
Dob<-c(20,16,20,18,19,20,17,16,17,20)

#vektor koji ce predstavljati kolonu "Ocijena"
Ocijena<-c(1,2,5,8,6,10,10,4,6,10)

data.frame(Ime,Dob,Ocijena)     #pomocu naredbe data.frame napravila sam tablicu s vektorima koje sam osmislila
df_students<-data.frame(Ime,Dob,Ocijena)  #novonastalu tablicu sam spremila u novu varijablu
View(df_students)  #pomocu ove naredbe sam tablicu prikazala kao novi file

#2) dodavanje novog stupca "Prolaz"

Prolaz<-c(NA)                             #dodala sam novi stupac sa praznim vrijednostima koje cu u kasnijim naredbama uvijetovati ovisno o Ocijeni
data.frame(Ime,Dob,Ocijena,Prolaz)
df_students<-data.frame(Ime,Dob,Ocijena,Prolaz)
View(df_students)                         #nova tablica sadr�i stupac prolaz sa praznim vijednostima

?ifelse      #bila mi je potrebna naredba koja bi popunila NA mjesta ovisno o ocijenama, prona�la sam obja�njena koja ovu naredbu cine pogodnom
?table       #u internetskim obja�njenjima prona�la sam da operatorom $ mogu pristupiti odredenom stupcu tablice koji sam zatim modificirala po zadanom uvijetu

df_students$Prolaz<-ifelse(df_students$Ocijena >= 5, TRUE, FALSE) #postavila sam uvijet da ako je ocijena veca ili jednaka od 5 da napi�e TRUE
View(df_students)   #novi prikaz tablice 

#3) studenti koji su pro�li

#stvorila sam novu varijablu kojoj sam zadala da mi ispi�e imena iz redka Ime ovisno o tome ispunjavaju li uvijet da u stupcu prolaz pi�e TRUE ili FALSE

studenti_prolaz<- df_students$Ime [df_students$Prolaz==TRUE]  #dva znaka jednakosti!
print(studenti_prolaz) #ispisana su imena studenata koji su pro�li

#4) studenti koji su pro�li, a stariji su od 18

#stvorila sam novu varijablu kojoj sam zadala da mi ispi�e imena studentata ovisno o dva uvijeta: dob i prolaz

studenti_prolaz_punoljetni <- df_students$Ime[df_students$Dob > 18 & df_students$Prolaz== TRUE]  #za spajanje uvijeta koristila sam operator &
studenti_prolaz_punoljetni


#5) prosijecni broj godina studenata koji su pali i pro�li
#5.1) studenti koji su pro�li

godine_prolaz<-mean(df_students$Dob[df_students$Prolaz == TRUE])  #koristila sam naredbu mean s kojom sam se upoznala u zadatku 2, srednju vrijednost dobi dodatno sam uvjetovala s pozitivnim prolazom
print(godine_prolaz)                                              #ispis nove varijable

#5.2) studenti koji su pali

godine_pad<-mean(df_students$Dob[df_students$Prolaz == FALSE])
print(godine_pad)

