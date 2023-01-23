

#####
## charger les packages2021

library(tidyverse)
library(ggtext)
library(ggrepel)

setwd("C:/Users/ludov/Documents/My_Econ_Tricks_/content/post/2023-01-13-les-courbes-repr-sentant-des-s-ries-temporelles-gt13")

nom_f<-paste0("yob",1880:2021)
nom<-paste0('names/',nom_f,'.txt')

dat<-map_df(nom,read_csv,col_names = FALSE,id="annee") %>% 
  rename(prenom=X1,sex=X2,effectif=X3) %>% 
  mutate(annee= as.numeric(gsub('\\D+','', annee)),
         )

dat_neil<-dat %>% filter(prenom=='Neil'&sex=='M'&annee>1911)

graph<-ggplot(data=dat_neil,aes(x = annee, y=effectif))+
  geom_line(color="#ECB84F",size=0.8)+
  #1
  geom_textbox(aes(x=1915,y=151,
                   label="Popularity of <b style='color:#ECB84F;'>Neil</b> before WW1 is low <br>
                   Neils born is 1912: **151**"),
               nudge_x =18, nudge_y = 40,width =unit(6, "cm"),
               size=3,box.colour='white')+
  geom_segment(aes(x=1912,y=151,xend=1917,yend=185),size=0.1,color='dark gray')+
  geom_segment(aes(x=1917,y=146,xend=1917,yend=225),size=0.1,color="#ECB84F")+
  #2
  geom_textbox(aes(x=1915,y=1926,
                   label="<b style='color:#ECB84F;'>Neil Johnson</b> leads NBA scoring <br>
                   for three successive seassons 1952-55 <br>
                   Neils born is 1954: **1956**"),
               nudge_x =18, nudge_y = 40,width =unit(6, "cm"),halign=1,
               size=3,box.colour='white')+
  geom_segment(aes(x=1954,y=1956,xend=1949,yend=1960),size=0.1,color='dark gray')+
  geom_segment(aes(x=1949,y=1915,xend=1949,yend=2010),size=0.1,color="#ECB84F")+
  #3
  geom_textbox(aes(x=1968,y=1689,
                   label="<b style='color:#ECB84F;'>Neil Amstrong</b> lands of on the moon <br>
                   Neils born is 1969: **1683**"),
               nudge_x =20, nudge_y = 40,width =unit(6, "cm"),
               size=3,box.colour='white')+
  geom_segment(aes(x=1969,y=1683,xend=1972,yend=1720),size=0.1,color='dark gray')+
  geom_segment(aes(x=1972,y=1680,xend=1972,yend=1760),size=0.1,color="#ECB84F")+  
  #4
  geom_textbox(aes(x=1978,y=1530,
                   label="Peack popularity of musicians 1972-1979 <br>
                   <b style='color:#ECB84F;'>Neil Young, Neil Sedaka, Neil Diamond</b> lands of on the moon <br>
                   Neils born is 1978: **1530**"),
               nudge_x =20, nudge_y = 30,width =unit(6, "cm"),
               size=3,box.colour='white')+
  geom_segment(aes(x=1978,y=1530,xend=1981,yend=1560),size=0.1,color='dark gray')+
  geom_segment(aes(x=1981,y=1480,xend=1981,yend=1620),size=0.1,color="#ECB84F")+ 
  #5
  geom_textbox(aes(x=1950,y=400,
                   label="Modern Neils like <b style='color:#ECB84F;'>Neil DeGrasse Tyson</b> <br>
                   ensure steady level of popularity post 2005 <br>
                   Neils born is 2009: **396**"),
               nudge_x =20, nudge_y = 30,width =unit(9, "cm"),
               size=3,box.colour='white',halign=1)+
  geom_segment(aes(x=2009,y=396,xend=1995,yend=399),size=0.1,color='dark gray')+
  geom_segment(aes(x=1995,y=360,xend=1995,yend=490),size=0.1,color="#ECB84F")+ 
  labs(title="Rise and Fall of the name <b style='color:#ECB84F;'>Neil</b> in the USA",
       subtitle = "Births 1912-2021",
       caption="Source: data.gov ")+
  scale_x_continuous(breaks = seq(1915,2015,10))+
  coord_cartesian(expand=FALSE,ylim=c(100,2050))+
  theme_minimal()+
  theme(plot.title = element_markdown(),
        axis.line.x = element_line(color='dark gray'),
        axis.title = element_blank(),
        axis.text.y = element_blank(),
        panel.grid = element_blank(),
        panel.background = element_rect(color='white'),
        plot.background = element_rect(color='white'))

graph

ggsave('Neil.png',graph,width = 20, height = 20, units = "cm")




