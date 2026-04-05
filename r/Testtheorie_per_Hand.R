library(tidyverse)
library(psychometric)
library(ggplot2)


df<-tribble(
  ~Pupils, ~Name, ~aufgabe1, ~aufgabe2, ~aufgabe3, ~aufgabe4, ~aufgabe5,
  1,	"Conny",   1, 1, 0, 0, 0,
  2,	"Johnny",	 1, 0, 1, 0, 0,
  3,	"Struppy", 1, 0, 1, 1, 0,
  4,	"Tim",	   1, 1, 1, 1, 0,
  5,	"Malou",	 0, 0, 0, 1, 1
)

df

schwierigkeit <- function(aufgabe, n, p){
  schwierigkeit <- sum(aufgabe)/(n*p)*100
  return(schwierigkeit)
}

schwierigkeit(df$aufgabe5, 4, 1)




df <-df %>% 
  select(aufgabe1:aufgabe5)

df$testscore <- rowSums(df)
df

#Die Item-Trennschärfe macht eine Aussage darüber, wie stark das Abschneiden 
#in einem Item mit dem Gesamt-Testscore zusammenhängt. Je höher die Trennschärfe, 
#desto besser vermag das Item zwischen Schüler/innen mit viel und wenig Wissen 
#(also einem hohen bzw. einem niedrigen Gesamt-Testscore) zu trennen. 
#Die Trennschärfe ist ein Kennwert, der zur Beurteilung der Güte eines Items 
#dienen kann.

cor(df$aufgabe5, df$testscore)







df <- data.frame(Item_1 = c(1, 1, 1, 0, 0, 0, 1, 1, 1, 0),
                        Item_2 = c(0, 0, 1, 0, 0, 0, 0, 0, 0, 0),
                        Item_3 = c(1, 0, 1, 0, 1, 1, 1, 0, 1, 0),
                        Item_4 = c(1, 0, 1, 0, 1, 0, 0, 0, 0, 0),
                        Item_5 = c(1, 0, 1, 0, 1, 0, 0, 0, 0, 0))

df$sum <- rowSums(df)


cor(df)


library(readxl)
Korrektur <- read_excel("C:/Users/gu99mywo/Dropbox/Lehre/Bildung/Vorlesung Bildung EF/Interactive/Klausur/Korrektur.xlsx")


ggplot(Korrektur, aes(x = Summe, y = A21))+
  geom_point()


library(ggbeeswarm)

cor(Korrektur$A21, Korrektur$Summe, use="complete.obs")



ggplot(Korrektur, aes(A21, Summe)) + 
  geom_smooth(method = "lm", formula = y ~ x)+
  geom_point()

#Plots hohe Trennschärfe
ggplot(Korrektur, aes(A21, Summe, color = Bestanden)) + 
  geom_quasirandom(size = 3)+
  theme_minimal(base_size = 18)+
  scale_color_viridis(discrete = TRUE, name = "EBF Klausur", option = "viridis")+
  labs(x = "Aufgabe 21",                
       y = "Punkte in der Klausur")+
  guides(color = guide_legend(override.aes = list(size = 4),
                              reverse=FALSE))


#Plots niedrige Trennschärfe
ggplot(Korrektur, aes(A2, Summe, color = Bestanden)) + 
  geom_quasirandom(size = 3)+
  theme_minimal(base_size = 18)+
  scale_color_viridis(discrete = TRUE, name = "EBF Klausur", option = "viridis")+
  labs(x = "Aufgabe 2",                
       y = "Punkte in der Klausur")+
  guides(color = guide_legend(override.aes = list(size = 4),
                              reverse=FALSE))








df$sum <- NULL
alpha(df) # erfordert Laden des Pakets psychometric



#DEL
x=seq(-2000,2000,length=1000) 
dat <- data.frame(x=x)
dat$value <- dlogis(x,location=200,scale=400/log(10))
dat$type <- "Expected score"       

ggplot(data=dat, aes(x=x, y=value)) + 
  geom_line(col="blue", size=1) + 
  coord_cartesian(xlim = c(-500, 900), ylim = c(0, 0.0016)) + 
  scale_x_continuous(breaks=c(seq(-500, 800, 100))) + 
  geom_line(aes(x = c(0,0), y = c(0,0.0011)), 
            size=0.9, colour="green", linetype=2, alpha=0.7)

