df <- data.frame(sleep)
View(df)
#moja hipoteza: Postoji statististički značajna razlika između promjene duljine sna između dviju skupina koje uzimaju 2 različita lijeka
#zašto:jer me zanima djeluju li lijekovi tako da produžuju san i čine razliku u duljini spavanja između 2 grupe
#radim provjeru normalnosti (je li normalna distribucija)
#odvajam podatke u dva vektora (svaki za jednu od 2 skupine)
#da bismo napravili histogram, qq plot shapiro-wilk test i anderson-darling test
fun<-function(x) {
  v1<-c()
  v2<-c()
  for (a in (1:nrow(x))) {
    if (x[a,2]==1){
      v1<-append(v1,x[a,1])
    }
    else if (x[a,2]==2){
      v2<-append(v2,x[a,1])
    }
  }
  rez<-cbind(v1,v2)
  return(rez)
}
rez<-fun(df)
v1<-rez[,1]
v2<-rez[,2]
hist(v1)
hist(v2)
shapiro.test(v1)
shapiro.test(v2)
qqnorm(v1)
qqline(v1)
qqnorm(v2)
qqline(v2)
install.packages('nortest')
library(nortest)
ad.test(v1)
ad.test(v2)
# null hipoteza za anderson-darling test i shapiro wilk test je da su podaci normalno distribuirani, s obzirom  da smo dobili p vrijednost vecu od 0.05 ne možemo odbaciti null hipotezu
#histogram i qqplot nisu savršene normalne distribucije, ali s obzirom na rezultate testova, prihvaćamo da su oba uzorka približno normalno distribuirani
#točnije, nema dovoljno dokaza da odbacim null-hipotezu
#radim t-test koji uspoređuje srednje vrijednosti dviju grupa
t.test(extra~group,data=df)
#P vrijednost je bila 0.07939, što je veće od praga 0.05. Dakle ne odbacujem null hipotezu
#zaključak je da nema statistički značajne razlike između produljenja sna prve i druge grupe, znači moja hipoteza nije točna