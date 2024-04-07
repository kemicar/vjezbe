#DATA SET
#odabrala sam data set "esoph" - "Smoking, Alcohol and (O)esophageal Cancer"
#učitala sam data set pomoću funckije data()
#data set sam pregledala u obliku tablice pomoću funkcije View()

data("esoph")
View(esoph)


#HIPOTEZA
#nulta hipoteza1: konzumacija različitih doza duhana i alkohola uzrokuje različitu incidenciju raka jednjaka
#alternativna hipoteza1: konzumacija različitih doza duhana i alkohola ne uzrokuje različitu incidenciju raka jednjaka

#nulta hipoteza2: različite dobne skupine imaju različitu incidenciju raka jednjaka 
#alternativna hipoteza2: različite dobne skupine nemaju različitu incidenciju raka jednjaka 

#ove hipoteze sam odabrala jer smatram da konzumacija alkohola, duhana i dob imaju utjecaj na incidenciju raka jednjaka

#data set sam pretvorila u data frame kako bih lakše upravljala podacima
df_esoph <- as.data.frame(esoph)
df_esoph

#htjela sam saznati ukupan broj ispitanika u istraživanju
n_ispitanici <- sum(df_esoph$ncontrols)
n_ispitanici

#zatim sam htjela saznati broj oboljelih ispitanika 
ncases <- sum(df_esoph$ncases)
ncases

#htjela sam dobiti pregled koliko alkohola su konzumirali oboljeli
ncases_alc0 <- sum(subset(df_esoph, alcgp == "0-39g/day")$ncases)
ncases_alc0

ncases_alc1 <- sum(subset(df_esoph, alcgp == "40-79")$ncases)
ncases_alc1

ncases_alc2 <- sum(subset(df_esoph, alcgp == "80-119")$ncases)
ncases_alc2

ncases_alc3 <- sum(subset(df_esoph, alcgp == "120+")$ncases)
ncases_alc3

ncases_alc_uk <- sum(subset(df_esoph, alcgp > "0-39g/day")$ncases)
ncases_alc_uk

#također sam htjela dobiti pregled koliko duhana su konzumirali oboljeli
ncases_tob0 <- sum(subset(df_esoph, tobgp == "0-9g/day")$ncases)
ncases_tob0

ncases_tob1 <- sum(subset(df_esoph, tobgp == "10-19")$ncases)
ncases_tob1

ncases_tob2 <- sum(subset(df_esoph, tobgp == "20-29")$ncases)
ncases_tob2

ncases_tob3 <- sum(subset(df_esoph, tobgp == "30+")$ncases)
ncases_tob3

ncases_tob_uk <- sum(subset(df_esoph, tobgp > "0-9g/day")$ncases)
ncases_tob_uk

#zatim me zanimalo koliko oboljelih je konzumiralo alkohola više od 0-39g/dan i duhana više od 0-9g/dan
ncases_alc_tob <- sum(subset(df_esoph, tobgp > "0-9g/day" & alcgp > "0-39g/day")$ncases)
ncases_alc_tob

#osim konzumacije alkohola i duhana zanimalo me i koja je dob oboljelih
ncases_age1 <- sum(subset(df_esoph, agegp == "25-34")$ncases)
ncases_age1

ncases_age2 <- sum(subset(df_esoph, agegp == "35-44")$ncases)
ncases_age2

ncases_age3 <- sum(subset(df_esoph, agegp == "45-54")$ncases)
ncases_age3

ncases_age4 <- sum(subset(df_esoph, agegp == "55-64")$ncases)
ncases_age4

ncases_age5 <- sum(subset(df_esoph, agegp == "65-74")$ncases)
ncases_age5

ncases_age6 <- sum(subset(df_esoph, agegp == "75+")$ncases)
ncases_age6


#STATISTIČKI TEST
#odlučila sam da ću koristiti chi-square test 
#željela sam provjeriti ima li razlike u incidenciji raka jednjaka ukoliko se konzumiraju različite doze duhana i alkohola
#također sam željela provjeriti ima li razlike u incidenciji raka jednjaka među različitim dobnim skupinama

#napravila sam tablicu koja prikazuje koliki broj oboljelih je konzumirao koje doze duhana
#pomoću te tablice sam napravila chi-square test 
tablica1 <- xtabs(ncases ~ ncases + tobgp, data = df_esoph)
tablica1

chi_square_result <- chisq.test(tablica1)
print(chi_square_result)

#rezultati: X-squared = 29.96, df = 3, p-value = 1.407e-06

#na isti način sam napravila tablicu koja prikazuje koliki broj oboljelih je konzumirao koje doze alkohola
#pomoću te tablice sam napravila chi-square test
tablica2 <- xtabs(ncases ~ ncases + alcgp, data = df_esoph)
tablica2

chi_square_result <- chisq.test(tablica2)
print(chi_square_result)

#rezultati: X-squared = 21.84, df = 3, p-value = 7.043e-05

#na isti način sam napravila tablicu koja prikazuje koliki broj oboljelih pripada određenoj dobnoj skupini
#pomoću te tablice sam napravila chi-square test
tablica3 <- xtabs(ncases ~ ncases + agegp, data = df_esoph)
tablica3

chi_square_result <- chisq.test(tablica3)
print(chi_square_result)

#rezultati: X-squared = 135.04, df = 5, p-value < 2.2e-16


#REZULTATI
#p-vrijednost je u sva tri testa jako mala (1.407e-06, 7.043e-05, 2.2e-16)
#odredila sam da je prag za prihvaćanje p-vrijednosti 0.05
#s obzirom da je p-vrijednost manja od 0.05 zaključujem sljedeće 
  #konzumacija različitih doza duhana i alkohola uzrokuje različitu incidenciju raka jednjaka
  #unutar različitih dobnih skupina postoji različita incidencija raka jednjaka
#dobiveni rezultati potvrđuju nultu hipotezu1 i nultu hipotezu2