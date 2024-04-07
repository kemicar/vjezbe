# ZADAĆA 2

# odabrala sam dataset Chick Weight koji ima 578 redaka i 
# 4 stupca iz eksperimenta o učinku prehrane na rani rast pilića

# 4 stupca označavala su: Weight (težina -numerički vektor koji daje tjelesnu težinu pilića)
# Time (Vrijeme -numerički vektor koji daje broj dana od rođenja kada je mjerenje izvršeno)
# Chick ( pilić - uređeni faktor s razinama 18 < ... < 48 koji daje 
# jedinstveni identifikator za pile. Redoslijed razina grupira
# piliće na istoj prehrani zajedno i poreda ih prema njihovoj konačnoj težini (od najlakše do najteže) unutar prehrane.)
# i 4. stupac Diet (Dijeta ili prehrana - faktor s razinama 1, ..., 4 koji pokazuje 
# koju je eksperimentalnu prehranu pile dobilo.)

# Tjelesne težine pilića mjerene su pri rođenju i svaki drugi dan nakon toga do 20. dana
# Također su izmjerene 21. dana
# Postojale su četiri skupine pilića na različitim proteinskim dijetama

# taj dataset sam uvela u R pomoću funkcije datasets
# zatim sam ga pretvorila u data.frame kako bih lakše njime upravljala
# također sam pogledala data frame  u novom prozoru pomoću View()


datasets::ChickWeight

chick<-as.data.frame(ChickWeight)
View(chick)


# zanimalo me utječe li Time (broj dana od rođenja kada je mjerenje izvršeno)
# i Diet (vrsta ekperimentalne prehrane) na weight ( težinu pilića)

# stoga sam postavila 2 hipoteze: Null i alternativnu
# Null hipoteza: Prehrana i vrijeme NE utječu na težinu pilića
# Alternativna: Prehrana i Vrijeme utječu na težinu pilića

# kako bih provjerila ove hipoteze napravila sam tablicu 
# koju sam pogledala u novom prozoru pomoću View()
# tablicu sam upotrijebila u chi.square testu koji testira povezanosti kategoričkih varijabli


tablica<-xtabs(weight~Diet+Time,data=chick)
View(tablica)

chisq.test(tablica)

# rezultati
# testom smo dobili p vrijednosti od <2.2e-16
# što označava da jako mala mogućnost da je nul hipoteza točna
# stoga odabujem nultu hipotezu i prihvaćam alternativnu
# odnosno: Prehrana i vrijeme utječu na težinu pilića


# zatim sam htijela vidjeti utječu li Chick i Diet, odnosno
# vrsta prehrane i pilića na težinu pilića
# Null hipoteza: Vrsta prehrane i pilića ne utječe na težinu pilića
# alternativna: Vrsta prehrane i pilića utječe na težinu pilića

# napravila sam novu tablicu, kako bih testirana ove hipoteze, ponovo 
# pomoću chi.square testa 

tablica_2<-xtabs(weight~Chick+Diet,data=chick)
View(tablica_2)
chisq.test(tablica_2)

# rezultat ovog testa je također bio <2.2e-16
# naime, ponovno odmacujem null hipotezu, jer
# vrsta prehrane i pilića utječe na težinu pilića