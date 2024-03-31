#Homework1

#Task1:functions
#kreiranje funkcije
my_func<-function(A,B) {
  dijeljenje<-A/B         #funkcija koja dijeli 2 zadana broja
  return(dijeljenje)
}

primjer1<-my_func(5,8.23)
primjer1

primjer2<-my_func(28.2,10.1)
primjer2


#Task2:vector operations
#kreiranje vektora
vec1<-c(1,2.2,3,4.6,5,6.78,7,8.14,9,10.05)

#suma svih elemenata
sum(vec1)

#srednja vrijednost vektora
mean(vec1)

#standardna devijacija
#kod za standardnu devijaciju pronašla sam na internetu i onda upisala ?sd u R-u kako bi provjerila je li to ta funkcija
?sd
sd(vec1)


#Task3:matrices and data frames
#kreiranje vektora za imena, godine i ocjene studenata
vec2<-c('Patrik', 'Ivan', 'Josip','Tino', 'Ante', 'Iris', 'Sunčica', 'Bella', 'Luciana', 'Cvjetka')
vec3<-c(16, 17, 16, 18, 19, 19, 20, 16, 17, 20)
vec4<-c(2, 4, 1, 3, 6, 7, 8, 10, 5, 9)

#kreiranje data frame-a sa 3 vektora
#spremanje data frame-a kao df_students

data.frame(vec2, vec3, vec4)
df_students<-data.frame(vec2, vec3, vec4)
df_students

#kreiranje data frame-a sa 3 kolumne
#prva kolumna zove se Name, druga Age i treća Grade
df_students<-data.frame(Name=vec2, Age=vec3, Grade=vec4)

#kreiranje vektora sa TRUE/FALSE
vec5<-c(F, F, F, F, T, T, T, T, F, T)

#dodavanje nove kolumne koja se zove Passed, koji su studenti prošli ispit, TRUE označava prolazak, a FALSE pad
df_students<-data.frame(Name=vec2, Age=vec3, Grade=vec4, Passed=vec5)
df_students
View(df_students)   #tablica koja prikazuje imena, godine, ocjene i prolaznost učenika

#izdvajanje učenika koji su prošli ispit, označavanje kolumne sa T=prolaz
#oznaku '$' koristimo za izdvajanje podataka, ovu funkciju pronalšla sam na internetu
students_passed<-df_students$Name [df_students$Passed==T]
students_passed

#učenici koji su stariji od 18 i prošli su ispit
students_passed_older<-df_students$Name [df_students$Passed & df_students$Age>18]
students_passed_older

#srednja dob učenika koji su prošli
average_age<-mean(df_students$Age[df_students$Passed==T])
average_age

#srednja dob učenika koji su pali 
#dodavanje F kod passed kako bi se razlučili učenici koji su pali
students_passed<-df_students$Name [df_students$Passed==F]
students_passed

average2_age<-mean(df_students$Age[df_students$Passed==F])
average2_age


