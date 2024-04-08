###Diameter, height and volume for black cherry trees
data("trees")
summary(trees)
View(trees)

##Hypothesis: there is a positive correlation between the tree diameter and the tree volue
#ako je zadana hipoteza ta da postoji jaka korelacija izmedu dijametra i volumena stabla
#moramo napraviti funkciju koja nam gleda vrijednost dijametra po volumenu, uzimajuci u obzir
#podatke koji su nam dani:

lm_model <- lm(Volume ~ Girth, data = trees)
summary(lm_model)

#statisticki test bit ce nam u obliku linearne funkcije, gdje gledamo ovisnost dijametra o volumenu, tj x o y.
#za utvrdivanje kakva nam je korelacija, potrebno je u konzoli promotriti vrijednosti Multiple-R squared.

multiple_r_squared <- summary(lm_model)$r.squared

#Ako je vrijednost multiple R-squared negativna ili veca od 1, smatramu korelaciju nepostojecom ili nedefiniranom
#Ako je vrijednost multiple R-squared izmedu 0 i 0.5, smatramo da je korelacija slaba
#Ako je vrijednost multiple R-squared izmedu 0.5 i 0.9, smatramo da je korelacija umjerena
#Ako je vrijednost multiple R-squared izmedu 0.9 i 1, smatramo da je korelacija jaka
if (multiple_r_squared > 0 && multiple_r_squared < 0.5) {
  cat("Korelacija je slaba.")
} else if (multiple_r_squared >= 0.5 && multiple_r_squared < 0.9) {
  cat("Korelacija je umjerena.")
} else if (multiple_r_squared >= 0.9 && multiple_r_squared <= 1) {
  cat("Korelacija je snazna.")
} else {
  cat("Korelacija je nepostojeca ili nedefinirana.")
}
##Zakljucak: s obzirom da vrijednost multiple R-squared iznosi 0.9353, mozemo zakljuciti da postoji snazna korelacija izmedu dijametra i volumena stabla crne tresnje.
