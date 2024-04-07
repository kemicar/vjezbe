data("chickwts")
str(chickwts)

#težina pileta ovisi o hrani kojom se hrani
#nulta hipoteza:kilaže među skupinama se nerazlikuju
#alternativna hipoteza:kilaže među skupinama se razlikuju

rezultati_statisticki <- aov(weight ~ feed, data = chickwts)
summary(rezultati_statisticki)


p_vrijednost <- summary(rezultati_statisticki)[[1]]$`Pr(>F)`[1]
p_vrijednost

#korišten je ANOVA test jer smo imali više numeričkih grupa
#testom je pokazano da je p-vrijednost manja od 0.05 što test čini značajnim
#što potvrđuje hipotezu da težina pileta ovisi o vrsti hrane
