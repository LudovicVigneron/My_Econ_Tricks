## chargeons les packages

library(tidyverse)
library(rvest)
library(janitor)

## scrap année de victoire

content_nba<-read_html('https://fr.wikipedia.org/wiki/Liste_des_champions_NBA')
tables_nba<- content_nba %>%  html_table(fill = TRUE)
tab_brute_<-tables_nba[[3]]%>% clean_names() %>% 
  mutate(team_f=equipe,id=1:33) %>% 
  filter(victoires>0)

unlist(tab_brute_$annees_victorieuses)

g<-c()
for(i in 1:33){
  gg<-str_split_1(tab_brute_$annees_victorieuses[i],",")
  g<-c(g,gg)
}
annee<-sort(unique(as.numeric(g)))


for(i in 1:20){
  assign(paste0("equ_",i),
         cumsum(annee%in%as.numeric(str_split_1(tab_brute_$annees_victorieuses[i],","))))
}

dtf<-data.frame(annee,mget(paste0("equ_",1:20)))

colnames(dtf)<-c("annee","LAK","CELT","WAR","BULL","SPURS","t76ers","PISTONS","HEAT","KNICKS",
                 "ROCKETS","BUCKS","CAV","HAWKS","WIZ","THUND","TRAILBL","MAV","RAPT",
                 "BULLET_BALT","KINGS")

dd_<-pivot_longer(dtf,cols=c(LAK,CELT,WAR,BULL,SPURS,t76ers,PISTONS,HEAT,KNICKS,
                             ROCKETS,BUCKS,CAV,HAWKS,WIZ,THUND,TRAILBL,MAV,RAPT,
                             BULLET_BALT,KINGS),
                 names_to="equipe",
                 values_to = 'victoires')

lakers<-cumsum(annee%in%as.numeric(str_split_1(tab_brute_$annees_victorieuses[1],",")))
celtics<-cumsum(annee%in%as.numeric(str_split_1(tab_brute_$annees_victorieuses[2],",")))
gold<-cumsum(annee%in%as.numeric(str_split_1(tab_brute_$annees_victorieuses[3],",")))
bulls<-cumsum(annee%in%as.numeric(str_split_1(tab_brute_$annees_victorieuses[4],",")))
spurs<-cumsum(annee%in%as.numeric(str_split_1(tab_brute_$annees_victorieuses[5],",")))



dat<-data.frame(annee,lakers,celtics,gold,bulls,spurs)

dd<-pivot_longer(dat,cols=c(lakers,celtics,gold,bulls,spurs),
                 names_to="equipe",
                 values_to = 'victoires')

ggplot(data=dat,aes(x=annee,y=lakers))+
  geom_step(aes(y=lakers),col='purple')+
  geom_step(aes(y=celtics),col='green')+
  geom_step(aes(y=gold),col='blue')+
  geom_step(aes(y=bulls),col='red')+
  theme_minimal()

ggplot(data=dd_,aes(x=annee,y=victoires,color=equipe))+
  geom_step()+
  scale_x_continuous(breaks = seq(1947,2022,5))+
  scale_y_continuous(breaks = 1:18)+
  coord_cartesian(expand = FALSE)+
  theme_minimal()+
  theme(
    axis.title = element_blank(),
    panel.grid = element_blank(),
    legend.position = "none")

  
  
  