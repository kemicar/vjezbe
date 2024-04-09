##ZADAĆA 2

##HIPOTEZA: različiti tretmani uzgoja biljaka ne utječu na rast istih

##otvaranje data set podataka iz PlantGrowth

data(PlantGrowth)


## izrada grafa kako bi se predočili podaci

library(ggplot2)

ggplot(PlantGrowth, aes(x = group, y = weight, fill = group)) +
  geom_boxplot() +
  labs(x = "Vrsta tretmana", y = "Veličina biljke", title = "Utjecaj tretmana biljaka na njihov rast")


## Pošto postoji više od dvije vrste podataka koji se uspoređuju koristi se Annova

test_hipoteze <- aov(weight ~ group, data = PlantGrowth)
summary(test_hipoteze)


##dobivena p-vrijednost iznosi 0.0159  Pošto je p-vrijednost < 0.05 (to nam označava zvijezdica pokraj p-vrijednosti  u rezultatu) odbacujem hipotezu te zaključujem kako potoji značajna statistička razlika između utjecaja tretmana na rast biljaka
