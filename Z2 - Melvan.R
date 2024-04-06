#odabrani data set: infert
data("infert")
str(infert)
View(infert)
head(infert)
#hipoteza: Postoji značajna razlika u broju trudnoća između žena koje su imale spontani pobačaj i žena koje su imale inducirani pobačaj
#H0: Broj trudnoća je faktor koji utječe na tip eventualnog pobačaja (spontani ili inducirani)
#H1: Broj trudnoća nije faktor koji utječe na tip eventualnog pobačaja (spontani ili inducirani)
#Data set infert sadrži podatke pacijentica koje imaju problema s neplodnošću.
#Podatci uključuju broj prethodnih trudnoća ("parity") i tip pobačaja ("spontaneous" ili "induced").
#Statistički test mogao bi ukazati na povezanost broja trudnoća s tipom pobačaja.
df_infertility <- as.data.frame(infert)
df_infertility
induced_abortion <- df_infertility$parity[df_infertility$induced > 0]
spontaneous_abortion <- df_infertility$parity[df_infertility$spontaneous > 0]
t.test_rezultat <- t.test(induced_abortion,spontaneous_abortion)
if(t.test_rezultat$p.value < 0.05){
  cat("razlika je statistički značajna")
} else{
  cat("razlika nije statistički značajna")
}
#T-test se koristi kada se želi ispitati postoji li statistički značajna razlika između aritmetičkih sredina 2 numeričke varijable
#REZULTATI:
#p-vrijednost = 0.3389 (veće od 0.05) - nije statistički značajno
#nema statistički značajne razlike u prosječnom broju trudnoća između žena koje su imale inducirani ili spontani pobačaj - odbacuje se H0 hipoteza
#zaključak: Broj trudnoća nije faktor koji utječe na tip eventualnog pobačaja (spontani ili inducirani)
