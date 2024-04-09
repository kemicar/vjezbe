#HIPOTEZA: Postoji linearna veza između duljine trajanja erupcije i vremena između erupcija u gejziru "Old Faithful".
#Očekivano je da će dulje erupcije obično biti praćene duljim razdobljima čekanja, dok će kraće erupcije obično biti praćene kraćim razdobljima čekanja. Stoga, analiza ovih varijabli je rađena kako bi postavili uvid u prirodu erupcija ovog gejzira.

# Učitavanje paketa
library(datasets)
library(ggplot2)

# Učitavanje podataka
data("faithful")
eruption <- faithful$eruptions
waiting <- faithful$waiting

#1 Stvaranje scatterplot grafikona
#Scatterplot grafikon prikazuje odnos između duljine trajanja erupcije i vremena između erupcija.
#Grafikon nam omogućuje vizualnu procjenu povezanosti između ovih dviju varijabli, te uočavamo linearnu povezanost, međutim potrebne su daljnje analize.
plot<-ggplot(faithful) +
  aes(x = eruptions, y = waiting) +
  geom_point(colour = "#0c4c8a") +
  theme_minimal()
print(plot)

#2 Pearsonov koeficijent korelacije
#Izračunali smo Pearsonov koeficijent korelacije između duljine trajanja erupcije i vremena između erupcija.
#Koeficijent blizu 1 ukazuje na jaku pozitivnu linearnu vezu, dok vrijednost blizu -1 je pokazatelj jake negativne linearne veze te ukoliko je koeficijent blizu nula, to znači da nema linearne veze.
correlation <- cor(waiting, eruption)
print(paste("Pearson correlation coefficient:", round(correlation, 3)))

#3 Interpretacija rezultata
#Na temelju izračunatog koeficijenta korelacije možemo zaključiti radi li se o jakoj, umjerenoj ili slaboj vezi između duljine trajanja erupcije i vremena između erupcija.
#Ako je koeficijent veći od 0.7 ili manji od -0.7, imamo visoku korelaciju između ove dvije varijable. 
#Ako je koeficijent između 0.4 i 0.7 ili između -0.4 i -0.7, riječ je o umjerenoj korelaciji.
#Ako je koeficijent manji od 0.4, ili između 0 i -0.4, prisutna je slaba korelacija.
if (abs(correlation) >= 0.7) {
  interpretation <- "Visoka korelacija"
} else if (abs(correlation) >= 0.4) {
  interpretation <- "Umjerena korelacija"
} else {
  interpretation <- "Slaba korelacija"
}

#4 Smjer korelacije
#Pozitivan koeficijent (>0) ukazuje na postojanje linearne veze između dvije varijable, točnije što je dulje vrijeme između erupcija, to je vjerojatnije da će i duljina trajanja erupcije biti dulja.
#Negativan koeficijent (<0) ukazuje na obrnutu vezu, odnosno što je dulje vrijeme između erupcija, to je vjerojatnije da će duljina trajanja erupcije biti kraća.
if (correlation > 0) {
  direction <- "pozitivna"
} else {
  direction <- "negativna"
}

print(paste("Rezultat interpretacije:", interpretation))
print(paste("Smjer korelacije:", direction))

#ZAKLJUČAK: Kao rezultat koeficijenta korelacije dobili smo broj 0.901 te time potvrdili hipotezu da su ove dvije varijable linearno proporcionalne.
#Točnije prisutna je visoka i pozitivna linearna korelacija. Visoka korelacija iz razloga što je broj koji smo dobili kao koeficijent korelacije veči od 0.7 (>0,7), a pozitivna iz razloga što je broj veći od nule (>0).
#Dakle, što je duže trajanje erupcije, to će više trebati vremena gejziru kako bi eruptirao, što se slaže s prirodnim karakteristikama gejzira.