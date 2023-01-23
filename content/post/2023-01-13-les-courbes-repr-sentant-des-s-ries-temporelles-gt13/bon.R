

gr4<-gr3+
  # annotation 1
  geom_richtext(aes(x=1962,y=5,
                    label="Les <b style='color:#30AF1E;'>Celtics</b> égalise <br> les <b style='color:#9370DB;'>Lakers</b> en nombre de titres"),
                nudge_x =-5.5, nudge_y = 0.5,size=2, fill='#FBFAF5',color='black',width =unit(2, "cm"))+
  # annotation 2
  geom_textbox(aes(x=2020,y=17,
                   label="Les <b style='color:#9370DB;'>Lakers</b> égalise <br> les <b style='color:#30AF1E;'>Celtics</b> en nombre de titres"),
               nudge_x =-5, nudge_y = 1,size=2, fill='#FBFAF5',color='black',width =unit(3.5, "cm"))+
  # annotation 3
  geom_textbox(aes(x=2022,y=7,
                   label="Les <b style='color:#0000FF;'>Warriors</b> obtiennent leur 7ème titres"),
               nudge_x =-10,size=2, color='black',width =unit(4, "cm"))+
  theme(
    plot.title = element_markdown(face='bold'),
    plot.subtitle = element_text(face='italic'),
    plot.caption = element_text(face='italic',hjust=1),
    axis.title = element_blank(),
    panel.grid = element_blank(),
    axis.line.x = element_line(color='black'),
    panel.background=element_rect(fill="#FBFAF5",color="#FBFAF5"),
    plot.background=element_rect(fill="#FBFAF5",color="#FBFAF5"),
    legend.position = "none")
gr4
