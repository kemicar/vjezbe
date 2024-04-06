#zadaca 2 - 5/6.4.2024.

#izabrala sam skup podataka "Hair and Eye Color of Statistics Students" te cu na ovome primjeru pokušati napraviti hipotezu te statisticki test

data("HairEyeColor") #prvo sam ucitala skup podataka koji sam odabrala
View(HairEyeColor)   #zatim sam taj isti skup pogledala u obliku tablice u novom prozoru

#u istraživanju je sudjelovalo 593 studenta, a podatci su se prikupljali u tri kategorije:
# 1) boja kose- Black, Brown, Red, Blond
# 2) boja ociju - Brown, Blue, Hazel, Green
# 3) spol - Male, Female


#HIPOTEZA:

#moja nulta hipoteza glasi:
#   H0 - Ne postoji razlika u raspodjeli boje kose ili boje ociju izmedu muškaraca i žena.

#postavljam i alternativnu hipotezu koja glasi:
#   H1 - Postoje razlike u raspodjeli boje kose ili boje ociju izmedu muškaraca i žena.

#nakon statisticke provjere podataka moci cu zakljuciti i odluciti koju hipotezu cu odbaciti, a koju zadržati

#STATISTIcKI TEST:

#nakon procavanja dane literature (https://www.geeksforgeeks.org/statistics-cheatsheet/) i uz pomoc interneta odlucila sam se za koištenje CHI-SQUARED TESTA

#CHI-KVADRAT TEST:
#koristi se za testiranje povezanosti izmedu dvije kategoricke varijable (boja kose/ociju,spol)
#pomocu njega može se provjeriti postoji li povezanost izmedu varijabli i moguce je identificirati eventualne razlike u raspodjeli

#u ovom slucaju želim utvrditi postoji li statisticki znacajna razlika u raspodjeli boje kose/boje ociju izmedu muškaraca i žena u skupu podataka koje sam odabrala

#KOD ZA STATISTICKU ANALIZU:

?chisq.test #tražila sam pomoc programa za test koji sam odabrala

#kako bi izdvojila podatke koje cu koristiti u testu prvo sam tablicu pretvorila u data frame

df_HEC <- as.data.frame(HairEyeColor)
View(df_HEC) 

#BOJA KOSE I SPOL:
#zatim sam izdvojila podatke - BOJA KOSE I SPOL

boja_kose <- df_HEC$Hair
spol <- df_HEC$Sex

#za provedbu testa potrebna mi je "tablica kontingencija" odnosno tablica koja pokazuje povezanost mojih kategorickih varijabli

kontingencija_tablica <- table(boja_kose, spol)
kontingencija_tablica #tablica prikazuje brojnost pojave svake kombinacije vrijednosti - boja kose, spol

#chi-kvadrat test
chi_kosa_spol <- chisq.test(kontingencija_tablica)
print(chi_kosa_spol)

#rezultati - BOJA KOSE I SPOL:
#X-kvadrat: 0
#df(broj stupnjeva slobode: 3
#p-vrijednost: 1 - parametar koji gledam

#p-razina znacajnosti: 0.05
#p-default < p-vrijednost --- 0.05 < 1

#zakljucujem da nema dovoljno dokaza da odbacim H0 odnosno smatram da je H0 ispravna hipoteza
#NE POSTOJE RAZLIKE U RASPODJELI BOJE KOSE IZMEÐU MUŠKARACA I ŽENA

#BOJA OCIJU I SPOL:
#izdvojila sam podatke koje cu koristiti u testu - BOJA OCIJU I SPOL

boja_ociju <- df_HEC$Eye
spol <- df_HEC$Sex

#za provedbu testa potrebna mi je nova tablica kontingencije 

kontingencija_tablica2 <- table(boja_ociju, spol)
kontingencija_tablica2 #tablica prikazuje brojnost pojave svake kombinacije vrijednosti - boja kose, spol

#chi-kvadrat test
chi_oci_spol <- chisq.test(kontingencija_tablica2)
print(chi_oci_spol)

#rezultati - BOJA OCIJU I SPOL:
#X-kvadrat: 0
#df(broj stupnjeva slobode: 3
#p-vrijednost: 1 - parametar koji gledam

#p-razina znacajnosti: 0.05
#p-default < p-vrijednost --- 0.05 < 1

#zakljucujem da nema dovoljno dokaza da odbacim H0 odnosno smatram da je H0 ispravna hipoteza
# NE POSTOJE RAZLIKE U RASPODJELI BOJE OCIJU IZMEÐU MUŠKARACA I ŽENA

