###ZADATAK 1 ###

### stvaranje funkcije čiji je zadatak izračunati razliku logaritma brojeva x i y koje sami proizvoljno zadajemo###
my_func<-function(x,y){
  zad <- log10(x) - log10(y)
  return(zad)
}
my_func(2,3)
my_func(40, 88)


###ZADATAK 2###

### stvaranje vektora koji sadrži 10 elemenata, tj brojeva###
vecdz1 <- c(1,4,7,87,45,22,40,79,21,100)
vecdz1

###izračun zbroje svih elemenanata vektora korištenjem naredbe sum###
sumvecdz <- sum (vecdz1)
sumvecdz

###izračun srednje vrijednosti svih elemenata vektora korištenjem naredbe mean###
meanvecdz <- mean (vecdz1)
meanvecdz

### izračun standardne devijacije svoh elemenata vektora korištenjem naredbe sd###
sdvecdz1 <- sd(vecdz1)
sdvecdz1


### ZADATAK 3 ###

###stavaranje tablice podataka koja sadrži 3 stupca i 11 redova, te otvaranje iste###
df_students <- data.frame (
  Ime = c("Nikica", "Tatjana", "Katarina", "Niko", "Marica", "Tajana", "Tara", "Dragan", "Miroslav", "Tigar"),
  Godine = c(16,17,18,19,20,19,18,17,16,20),
  Ocjena = c(1,8,6,7,2,4,9,8,1,6)
)

View(df_students)

###dodavanje novog stupca imena Položili čiji je uvjet ukoliko je ocjena >5 tada su studenti položili (izražava se kao TRUE u tablici), a ako uvjet nije zadovoljen, tada student nije položio (izražava se kao FALSE u tablici)###
df_students$Polozili <- df_students$Ocjena>5


### filtriranje imena studenata koji su položili, tj onih koji zadovoljavaju gore zadani kriterij da je ocjena >5####
imenapolozili <- df_students$Ime[df_students$Polozili]
print(imenapolozili)

#### filtrira imena studenata korištenjem uvjeta da su godine >18 te da su položili###
polozilistariji <- subset(df_students, Godine>18 & Polozili==TRUE)
print (polozilistariji)


### korištenjem naredbe mean računa se srednja vrijednost godina studenata koji su položili, odnosno onih koji nisu###
prosjekpolozili <- mean (df_students$Godine[df_students$Polozili])
prosjekpali <- mean (df_students$Godine[!df_students$Polozili])

print (prosjekpolozili)
print(prosjekpali)

