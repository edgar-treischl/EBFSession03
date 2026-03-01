library(plotly)
library(ggplot2)
library(tidyverse)
library(HistData)
library(viridis)

library(tidyverse)
library(gapminder)
library(viridis)
library(ggforce)
library(ggrepel)
library(concaveman)



setwd("C:/Users/gu99mywo/Dropbox/Lehre/Bildung/Vorlesung Bildung EF/SoSe2021/Folien/03_Zentrale_Befunde")

library(readxl)
leaky_pipeline <- read_excel("leaky_pipeline.xlsx")


df <- Galton


leaky_pipeline$Gruppe <- factor(leaky_pipeline$Gruppe, levels = c("Studienanfänger", "Studierende",
                                                                  "Absolventen", "Promotionen", 
                                                                  "Habilitationen", "C4-Professoren"))

palette <- c("#29303B", "#0057AD", "#C69472", "#8A8FA1", "#C70C0B")



ggplot(leaky_pipeline, aes(x=Gruppe, y=`2019`, group = Sex, color = Sex)) +
  geom_line(size = 1) +
  geom_point(size = 2)+
  #geom_smooth(method = "lm", formula = y ~ x)+
  theme_minimal(base_size = 18)+
  #scale_color_viridis(discrete = TRUE, name = "EBF Klausur", option = "viridis")+
  geom_label(data = leaky_pipeline %>% filter(Gruppe == "Habilitationen"),
             aes(label = Sex, color = Sex),
             #hjust = 1.0,
             #vjust = 0.5,
             fontface = "bold",
             size = 5.5)+
  labs(caption = "Daten: destatis.de",
       y = "Anteile nach akademischer Laufbahn (2019)")+
  theme(legend.position="none")+
  scale_color_manual(values = palette)
  
  #scale_fill_manual(values=palette)
  

#Trennschärfeplot#############

library(readxl)
Korrektur <- read_excel("C:/Users/gu99mywo/Dropbox/Lehre/Bildung/Vorlesung Bildung EF/Interactive/Klausur/Korrektur.xlsx")

library(ggbeeswarm)
library(viridis)

ggplot(Korrektur, aes(A21, Summe, color = Bestanden)) + 
  geom_quasirandom(size = 3)+
  theme_minimal(base_size = 18)+
  scale_color_viridis(discrete = TRUE, name = "EBF Klausur", option = "viridis")+
  labs(x = "Aufgabe 21",                
       y = "Punkte in der Klausur")+
  guides(color = guide_legend(override.aes = list(size = 4),
                              reverse=TRUE))
















