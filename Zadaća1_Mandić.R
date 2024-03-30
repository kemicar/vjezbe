#Zadaća

##Zadatak 1:
my_func<- function(broj1,broj2){
  operacija<- broj1 + broj2^3
  return(operacija)
}

my_func(10,6)
my_func(4,11)

#Napravila sam funckiju my_func s dva argumenta odnosno broja.
#Koristila sam zbrajanje kao matematičku operaciju, s tim da sam koristila
#treću potenciju na drugom broju.
#Za operaciju sam koristila brojeve 10 i 6, 4 i 11.



##Zadatak 2
vec1<- c(12, 15, 10, 22, 6, 9, 25, 24, 92, 1 )

sum(vec1)
mean(vec1)
sd(vec1)

#Napravila sam vektor pod nazivom vec1 i izračunala sumu,srednju vrijednost i
#standardnu devijaciju pomoću naredbi u R-u




##Zadatak 3
#1Prvo sam napravila 3 vektora te od njih data frame.
#Zatim sam spremila data frame kao skraćenicu df

ime<-c("Ante","Lara","Ivan","Enzo","Ivica","Helena","Nataša","Mihovil","Vito","Nika")
dob<-c(20,19,17,16,18,19,20,19,17,17)
ocjena<-c(3,9,5,10,8,6,8,9,3,4)

data.frame(ime,dob,ocjena)

df<-data.frame(ime,dob,ocjena)
df

#2 Kako bih dodala stupac, koristila sam $. Pomoću te naredbe sam pristupila
#novom stupcu čiji je uvijet bio da prolaznost bude za ocjene veće od 5

df$df_prolaznost<-ocjena>5
df

#3Zatim sam pomoću $ izdvojila imena iz data frame-a studenata koji su ostvarili
#prolaznu ocjenu. Te sam koristila [] kako bi mogla odabrati drugi element data
#frame-a (prvi-ime, drugi-prolaznost)

df$ime[df$df_prolaznost]

#4 Ovdje sam napravila istu stvar kao i u prethodnom zadatku, samo sam koristila &
#zbog dodatnog uvjeta (dob >18)

df$ime[df$df_prolaznost & df$dob>18]

#5 Na kraju sam izračunala prosječnu dob studenata koji su prošli, odnosno nisu.
#Koristila sam ! kao znak "logične negacije" kako bih izračunala prosječnu dob studenata
#koji nisu položili.

mean(df$dob[df$df_prolaznost])
mean(df$dob[!df$df_prolaznost])

#Kako bih uspješno rješila zadaću koristila sam se materijalima s vježbi,
#internetom i help opcijom u R-u. ( naročito da si više pojasnim indeksiranje i
#neke od ostalih naredbi, poput !)


