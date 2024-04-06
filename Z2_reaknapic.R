#odabrala sam dataset Titanic te sam ga loadala u RStudio
data("Titanic")

#kako bih dobila osnovni pregled svojeg dataseta, koristila sam funkciju str()
str(Titanic)

#Titanic dataset sam pretvorila u data frame 'Titanic_df' zbog bolje vizualizacije, ali i jednostavnijeg upravljanja podacima
Titanic_df <- as.data.frame(Titanic)
print(Titanic_df)

#zanimao me ukupan broj putnika, žena i muškaraca pa sam i to provjerila
total_individuals <- sum(Titanic_df$Freq)
total_individuals

women_count <- sum(subset(Titanic_df, Sex == "Female")$Freq)
women_count

men_count <- sum(subset(Titanic_df, Sex == "Male")$Freq)
men_count

#na identičan sam način dobila broj preživjelih (od ukupnih putnika, žena i muškaraca)
total_individuals_survived <- sum(subset(Titanic_df, Survived == "Yes")$Freq)
total_individuals_survived

women_count_survived <- sum(subset(Titanic_df, Sex == "Female"& Survived == "Yes")$Freq)
women_count_survived

men_count_survived <- sum(subset(Titanic_df, Sex == "Male" & Survived == "Yes")$Freq)
men_count_survived 


#obzirom na to da sam u svoju hipotezu htjela uključiti utjecaj spola na preživljenje, moje hipoteze su glasile ovako:

## nulta hipoteza: Ne postoji poveznica između stope preživljenja putnika Titanica i njihovog spola.

## alternativna hipoteza: Žene su imale veću vjerojatnost za preživljenje potonuća Titanica.

#ovu hipotezu sam odabrala iz više razloga, od kojih se prvi svakako odnosi na društvene norme koje su prevladavale u doba potonuća Titanica (početak 20. stoljeća): prioritet je bila sigurnost žene i djece zbog čega se njima davala prednost pri evakuaciji, u odnosu na muškarce 
#zbog većeg udjela masnog tkiva, žene su imale bolje izglede za preživljenje uvjeta u kojima su se našli pri potonuću Titanica (hladna voda)
#žene su češće slijedile upute procesa evakuacije, što je također moglo doprinijeti preživljenju

#kako bi mogla testirati svoju hipotezu, za početak sam napravila contingency table - tablicu koja se često koristi u statističkim analizama za prikaz frekvencije željenih varijabli
#moja hipoteza se bazira na spolu, zbog čega sam napravila tablicu koja prikazuje brojeve muškaraca koji su preživjeli i muškaraca koji nisu, te brojeve žena koje su preživjele i žena koje nisu
cont_table <- xtabs(Freq ~ Survived + Sex, data = Titanic_df)
cont_table

#tu tablicu sam iskoristila za chi-square test
chi_square_result <- chisq.test(cont_table)
print(chi_square_result)


#dobila sam sljedeće rezultate chi-square testa:
##X-squared = 454.5, df = 1, p-value < 2.2e-16

#X-squared vrijednost (454.5) - odnosi se na odstupanje između promatranih frekvencija i onih očekivanih ako uzmemo pretpostavku da nema poveznice između stope preživljavanja i spola (nulta hipoteza)
#df (1) - stupnjevi slobode; računa se kao umnožak broja redaka tablice - 1 i broja stupaca - 1
## u mojem su slučaju 2 reda i 2 stupca
# p-vrijednost (< 2.2e-16) - u ovom slučaju je vrlo mala, što upućuje na to da postoji veza između spola i preživljavanja 
##zbog ovoga se odbacuje nulta hipoteza
##potvrđena je alternativna hipoteza jer postoji značajna razlika u stopama preživljavanja između žena i muškaraca


