#zadaća 2
#otvorila sam poveznicu https://stat.ethz.ch/R-manual/R-devel/library/datasets/html/00Index.html i u njoj odabrala željene podatke
#odabrala sam povezanost konzumacije alkoloha i duhana sa nastankom tumora jednjaka
#u R-u sam upotrijebila komandu install.packages kako bhi instalirala datasets.load
#upisala sam komandu esoph i pomoću komande View otvorila tablicu s podatcima

install.packages("datasets.load")
View(esoph)

#nulta hipoteza (H0): Konzumacija alkohola i duhana povećava rizik za razvoj tumora jednjaka.
#alternativna hipoteza (H1): Starije osobe imaju povećani rizik za razvoj tumora jednjaka neovisno o tome u kojim količinama konzumiraju alkohol/duhan.
#odabrala sam H1 jer prema podatcima, osobe između 45. i 75. godine boluju od tumora jednjaka, a uz to većinom konzumiraju veće količine alkohola(80-120gm/danu) i duhana(20-30gm/danu)
#s druge strane, osobe između 65. i 74. godine koji konzumiraju alkohol i duhan u manjim količinama također imaju rizik za razvoj tumora jednjaka
#to nam ukazuje na to da nužno ne mora povećana konzumacija alkohola i duhana uzrokovati nastanak tumora jednjaka već da postoji i neki drugi čimbenici (npr. genetika)
#iz podataka u tablici može se zaključiti kako mlađi od 45 g. ne obolijevaju od tumora jednjaka

#statistički test

#pomoću chatgpt-a i statistic cheat sheet-a pronašla sam vrste statističkih testova i u koje se svrhe koriste
#odlučila sam koristiti ANOVA test jer u podatcima postoji više grupa


#podatke esoph odlučila sam promijeniti u data
data("esoph")

#ANOVA funkcija nije radila kada sam upisala agegp i ncases te sam odlučila provjeriti pomoću komande class() što su agegp i ncases
class(esoph$agegp)   #faktor
class(esoph$ncases)  #brojevi

#pomoću komande as.numeric pretvorila sam agegp iz faktora u brojeve kako bi komanda ANOVA radila
agegp1<-as.numeric(esoph$agegp)

#provjerila sam pomoću class() komande ako je agegp postao broj
class(agegp1)

#pomoću chatgpt-a pronašla sam komandu za ANOVA test
rezultati<-aov(agegp1~ncases, data = esoph)
summary(rezultati)

#kako bi odredila koju hipotezu odbacujem potrebno je bilo pronaći p vrijednost u ANOVA testu
p_value<-rezultati$`Pr(>F)`
p_value

#kako bi se zaključilo koju hipotezu odbacujemo potrebno je odabrati značajnu razinu, obično se uzima da je ona 0.05
#ukoliko je p vrijednost manja od 0.05 tada se odbacuje nulta hipoteza, a alternativna se prihvaća i obrnuto
#u mom slučaju p vrijednost iznosi 0.000962, to je manje od 0.05 što znači da odbacujemo nultu hipotezu
#zaključak: Starije osobe imaju povećan rizik za nastanak tumora jednjaka



