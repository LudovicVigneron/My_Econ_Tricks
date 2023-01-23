
library(tidyverse)
library(rvest)
library(janitor)

dat<-data.frame(don=c(0,1,5,6,9),an=1:5)


content_nba<-read_html('https://fr.wikipedia.org/wiki/Liste_des_champions_NBA')

tables_nba<- content_nba %>%  html_table(fill = TRUE)


tab_brute_<-tables_nba[[3]]%>% clean_names() %>% 
  mutate(team_f=equipe)


content_crea<-read_html('https://en.wikipedia.org/wiki/National_Basketball_Association')

tables_crea<- content_crea %>%  html_table(fill = TRUE)
tab_brute_crea<-tables_crea[[4]]%>% clean_names()

tab_brute_crea_<-tab_brute_crea %>% filter(!team%in%c("Eastern Conference",
                                                      "Western Conference")) %>% 
  select(team,founded,joined) %>% 
  mutate(team_f=c("Celtics de Boston","Nets de Brooklyn(inclus le bilan des Nets du New Jersey)",
                  "Knicks de New York","76ers de Philadelphie(inclus le bilan des Nationals de Syracuse)",
                  "Raptors de Toronto","Bulls de Chicago","Cavaliers de Cleveland",
                  "Pistons de Détroit(inclus le bilan des Pistons de Fort Wayne)",
                  "Pacers de l'Indiana","Bucks de Milwaukee",
                  "Hawks d'Atlanta(inclus le bilan des Hawks de Saint-Louis)",
                  "Hornets de Charlotte","Heat de Miami","Magic d'Orlando",
                  "Wizards de Washington(inclus le bilan des Bullets de Washington)",
                  "Nuggets de Denver","Timberwolves du Minnesota",
                  "Thunder d'Oklahoma City(inclus le bilan des SuperSonics de Seattle)",
                  "Trail Blazers de Portland","Jazz de l'Utah",
                  "Warriors de Golden State(inclus le bilan des Warriors de Philadelphie et San Francisco)",
                  "Clippers de Los Angeles",
                  "Lakers de Los Angeles(inclus le bilan des Lakers de Minneapolis)",
                  "Suns de Phoenix","Kings de Sacramento(inclus le bilan des Royals de Rochester)",
                  "Mavericks de Dallas","Rockets de Houston","Grizzlies de Memphis",
                  "Pelicans de La Nouvelle-Orléans","Spurs de San Antonio"))



ds<-left_join(tab_brute_,tab_brute_crea_)



tabb1<-c("Lakers de Los Angeles(inclus le bilan des Lakers de Minneapolis)",
        str_split_1(ds$annees_victorieuses[1],","))
tabb2<-c("Celtics de Boston)",
         str_split_1(ds$annees_victorieuses[2],","))


tt<-rbind(tabb1[1:18],tabb2)

x<-1947:2022
lakers<-c(0,0,1,2)
l1<-x-as.numeric(str_split_1(ds$annees_victorieuses[1],","))[1]

l12<-x%in%as.numeric(str_split_1(ds$annees_victorieuses[1],","))
cl12<-cumsum(x%in%as.numeric(str_split_1(ds$annees_victorieuses[1],",")))
cl22<-cumsum(x%in%as.numeric(str_split_1(ds$annees_victorieuses[2],",")))
cl23<-cumsum(x%in%as.numeric(str_split_1(ds$annees_victorieuses[3],",")))


c("Bullets de Baltimore (disparue en 1954)(Équipe non affiliée aux Wizards de Washington)",
   "Stags de Chicago (disparue en 1950)","Capitols de Washington (disparue en 1951)")

ggplot(data=dat,aes(x=an,y=don))+
  geom_point()+
  geom_step()
