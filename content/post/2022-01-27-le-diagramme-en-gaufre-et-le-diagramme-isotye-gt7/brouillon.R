
```{r}
devtools::install_github("liamgilbey/ggwaffle")
```


```{r}
library(ggwaffle)
waffle_data <- waffle_iron(mpg, aes_d(group = class))

ggplot(waffle_data, aes(x, y, fill = group)) + 
  geom_waffle()
```


```{r}
iris$Species <- as.character(iris$Species)
waffle_data <- waffle_iron(iris, aes_d(group = Species))

ggplot(waffle_data, aes(x, y, fill = group)) + 
  geom_waffle() + 
  coord_equal() + 
  scale_fill_waffle() + 
  theme_waffle()
```

```{r}
library(emojifont)  
library(dplyr)

iris$Species <- as.character(iris$Species)
waffle_data <- waffle_iron(iris, aes_d(group = Species)) %>% mutate(label = fontawesome('fa-twitter'))

ggplot(waffle_data, aes(x, y, colour = group)) + 
  geom_text(aes(label=label), family='fontawesome-webfont', size=4) +
  coord_equal() + 
  scale_colour_waffle() + 
  theme_waffle()  
```




```{r}
df22 <- data.frame(
  x = sort(LETTERS[1:5], decreasing = TRUE),
  y = sort(sample(20:80,5))
)
```

```{r}
library(echarts4r)
library(echarts4r.assets)
ea_bank()
```





```{r}
library(echarts4r)
library(echarts4r.assets)

df22 %>% 
  e_charts(x) %>% 
  e_pictorial(y, symbol = ea_icons("user"), 
              symbolRepeat = TRUE, z = -1,
              symbolSize = c(20, 20)) %>% 
  e_theme("westeros") %>%
  e_title("People Icons") %>% 
  e_flip_coords() %>%
  # Hide Legend
  e_legend(show = FALSE) %>%
  # Remove Gridlines
  e_x_axis(splitLine=list(show = FALSE)) %>%
  e_y_axis(splitLine=list(show = FALSE)) %>%
  # Format Label
  e_labels(fontSize = 16, fontWeight ='bold', position = "right", offset=c(10, 0))
```



```{r}
# Sample data
library(RCurl)
url <- "file:///C:/Users/ludov/Downloads/icons8-chat-noir-64.svg"
svg3 <- getURL(url)

# Parse the file
library(XML)
doc <- htmlParse(svg)

# Extract the coordinates, as strings
p <- xpathSApply(doc, "//polygon", xmlGetAttr, "points")

# Convert them to numbers
p <- lapply( strsplit(p, " "), function(u) 
  matrix(as.numeric(unlist(strsplit(u, ","))),ncol=2,byrow=TRUE) )
p
```


```{r}
Unity <- "https://www.pngmart.com/files/2/Batman-PNG-Image.png"

data <- data.frame(
  x = c("Joker libre", "Joker à arkam"), 
  value = c(182, 129),
  symbol = c(paste0("image://", Unity),
             paste0("image://", Unity))
)

data %>% 
  e_charts(x) %>% 
  e_pictorial(value, symbol) %>% 
  e_theme("westeros") %>% 
  e_legend(FALSE) %>% 
  # Title Alignment
  e_title("Gotham crimes graph", left='center', padding=10) %>%
  e_labels(show=TRUE) %>%
  e_x_axis(splitLine=list(show = FALSE)) %>%
  e_y_axis(show=FALSE, min=0,max=200, interval=20, splitLine=list(show = FALSE))
```



```{r}
cat(
  ea_icons("volume")
)
```


```{r}
df22 %>% 
  e_charts(x) %>% 
  e_pictorial(y, symbol = "path://M72.5,65.9 M90,50c0,8.6-2.5,16.9-7.3,24.1c-0.4,0.6-1,0.9-1.7,0.9c-0.4,0-0.8-0.1-1.1-0.3
		c-0.9-0.6-1.2-1.8-0.6-2.8C83.7,65.4,86,57.8,86,50c0-7.8-2.3-15.3-6.6-21.9c-0.6-0.9-0.4-2.2,0.6-2.8c0.9-0.6,2.2-0.3,2.8,0.6
		C87.5,33.1,90,41.4,90,50z M79.8,50c0,5.8-1.5,11.6-4.4,16.8c-0.4,0.6-1,1-1.7,1c-0.3,0-0.7-0.1-1-0.3c-1-0.5-1.3-1.8-0.8-2.7
		c2.6-4.5,3.9-9.6,3.9-14.8c0-5.2-1.3-10.3-3.9-14.8c-0.5-1-0.2-2.2,0.8-2.7c1-0.5,2.2-0.2,2.7,0.7C78.3,38.4,79.8,44.2,79.8,50z
		 M69.6,50c0,3.2-0.6,6.2-1.8,9.1c-0.3,0.8-1.1,1.2-1.8,1.2c-0.2,0-0.5,0-0.8-0.1c-1-0.4-1.5-1.6-1.1-2.6c1-2.4,1.5-4.9,1.5-7.6
		s-0.5-5.2-1.5-7.6c-0.4-1,0.1-2.2,1.1-2.6c1-0.4,2.2,0.1,2.6,1.1C69,43.8,69.6,46.9,69.6,50z M58,16v68c0,0.8-0.5,1.5-1.2,1.8
		C56.5,85.9,56.3,86,56,86c-0.5,0-1-0.2-1.4-0.6L36.2,67H12c-1.1,0-2-0.9-2-2V35c0-1.1,0.9-2,2-2h24.2l18.4-18.4
		c0.6-0.6,1.4-0.7,2.2-0.4C57.5,14.5,58,15.2,58,16z M35,37H14v26h21V37z M54,20.8l-15,15v28.3l15,15V20.8z", 
		symbolRepeat = TRUE) %>% 
  e_theme("westeros") %>%
  e_title("People Icons") %>% 
  e_flip_coords() %>%
  # Hide Legend
  e_legend(show = FALSE) %>%
  # Remove Gridlines
  e_x_axis(splitLine=list(show = FALSE)) %>%
  e_y_axis(splitLine=list(show = FALSE)) %>%
  # Format Label
  e_labels(fontSize = 16, fontWeight ='bold', position = "right", offset=c(10, 0))
```

```{r}
svg
```


```{r}
svg2
```


```{r}
#sub('<path fill','n',svg2)
licc<-paste0('path://',substring(svg2, regexpr(" d=", svg2) + 4,regexpr("z", svg2)))
```


```{r}
ec<-"path://m457.48318,229l16.05206,35.46691l-6.61892,4.18565l20.21261,30.38737l-6.61595,5.07481l24.98701,50.88525l-42.38243,-38.99515l8.08386,-5.41534l-26.33333,-24.97676l9.43611,-7.71863l-27.8042,-26.20172l30.98318,-22.69239z"
```


```{r}
lic<-"path://m461.77766,580.16185c-11.90777,-15.16433 -30.42486,-16.8936 -34.87746,-38.47804c-3.48995,-11.74018 -36.39049,-27.48609 -16.91837,-6.41407c15.03592,12.69782 32.89953,59.5334 -4.09202,44.73566c-28.13484,-9.61384 -29.34128,-39.30047 -36.88275,-61.5258c-24.52435,-15.84223 6.34059,-49.33946 -20.06516,-69.63754c-22.411,-21.18877 -6.80315,-60.8722 -38.8266,-75.89621c-16.07364,-6.07418 -23.03106,35.86525 -25.73743,5.18381c-8.80605,-31.03119 -39.90669,15.08454 -60.64547,10.19555c-16.735,-1.35456 27.99332,-12.18695 6.64873,-15.10204c-12.54899,6.39619 -24.15983,17.45559 -26.14518,-0.85099c-15.09568,-8.34754 -46.75165,-21.67823 -45.92932,-34.9391c13.10906,-3.83426 57.36374,7.26038 49.69458,-8.15534c-13.15981,-4.65001 -15.55036,-17.36111 0.56782,-8.83029c31.76443,0.92776 69.00137,-10.87785 95.4314,11.70169c13.78599,7.8979 27.34087,36.22368 34.72118,8.69632c23.79068,-26.71677 71.79642,-28.97977 86.46228,-63.5713c3.54895,-16.73582 -10.89972,-26.28409 -23.17431,-29.67404c-2.38803,-5.49999 -6.45322,-28.85089 -16.60348,-17.06729c0.46263,-10.31344 9.9841,-34.97651 -11.10629,-24.05816c-2.13915,-21.96699 18.02965,-43.8828 -8.65096,-59.87943c24.9983,4.31776 20.06874,-22.21721 14.62388,-26.42556c14.81877,-1.95918 32.2093,-14.37517 24.03874,-29.75647c16.09279,27.20195 16.6508,-33.001 29.8999,-7.05172c24.38506,3.72219 -7.57554,-20.28455 14.85273,-14.92617c12.8068,0.40801 9.96246,-13.06525 21.46735,-2.89652c15.22654,-7.73551 -11.67265,-31.11349 12.91223,-14.8702c8.26455,6.685 34.57656,24.19401 29.85558,1.08933c23.36112,23.20237 41.7451,-21.55105 61.15729,-30.81905c7.69989,-8.57697 24.44396,-17.65407 9.00154,-1.28157c-10.25176,20.86989 -45.03252,43.44668 -35.67542,64.18395c-8.46964,7.17934 17.08878,16.20252 -3.25679,13.48452c-12.0533,12.11419 16.15956,34.77909 18.41108,53.84495c-6.46247,13.0635 -31.07004,27.89404 -41.02442,27.4253c3.63823,-16.81927 -4.24895,-38.74128 -27.28595,-29.23432c12.90487,21.98508 30.35207,42.98777 41.28336,66.89615c10.68455,23.50308 28.0077,50.64438 50.79872,20.3959c14.52634,-19.27911 56.0245,-19.00003 44.6253,12.30933c-5.82731,30.74487 9.77416,71.32191 -20.2037,92.50006c-18.0843,32.44592 -38.13317,-12.06409 -23.92535,-28.90262c-3.6203,-4.81192 -6.42099,-8.20868 4.17293,-14.78625c-2.18747,-4.93387 30.48751,-23.4964 14.01944,-34.88666c-18.72973,19.77475 -46.13565,42.66411 -38.51923,72.05901c6.18156,19.69813 -44.80098,53.46879 -40.72413,20.7779c0.91319,-12.70479 20.39482,-37.32808 15.91041,-40.50031c-14.22336,24.84822 -34.45678,48.72024 -65.03154,56.0977c-25.4322,1.40324 -38.75461,20.46906 -26.67734,41.62279c2.30807,29.97579 -14.68632,57.10537 -18.59884,86.29102c7.27291,30.95523 51.55238,37.2105 57.56267,68.7872c10.32753,21.20692 -15.50568,18.07288 -27.54169,12.1389l0.00006,0.00002zm-62.96916,-92.34943c-3.72783,-13.9927 -11.39942,36.37415 -1.94279,9.64147l1.41568,-4.72292l0.52712,-4.91856l0,0.00002z"
```

```{r}
licc<-paste0('path://',substring(svg3, regexpr(" d=", svg3) + 4,regexpr("z", svg3)))
licc
```


```{r}
svg3
```



```{r}
df22 %>% 
  e_charts(x) %>% 
  e_pictorial(y, symbol ="path://-M297 593C293 590 296 580 302 572 312 561 310 555 295 544 271 526 256 527 202 545 166 558 154 558 132 548 105 535 79 491 66 438L60 411 137 413C180 414 227 412 243 407 268 400 270 402 271 432 271 463 272 464 281 441 293 410 283 377 263 384 233 396 142 402 127 394 103 380 134 311 169 304 239 290 270 278 306 249 345 218 351 217 424 236 455 244 458 226 434 177 412 134 371 101 339 100 325 100 305 94 294 86 276 72 276 71 303 65 354 52 402 69 447 115 495 165 510 209 510 296 510 350 514 364 545 408L579 458 560 527C549 564 540 596 540 597 540 599 526 600 509 600 478 600 478 600 494 575 512 548 516 500 500 500 495 500 472 483 449 463 411 429 409 428 415 451 420 471 416 478 397 487 383 494 370 511 366 527 352 582 318 615 297 593ZM135 491C132 485 124 480 118 480 112 480 112 486 120 495 134 512 146 508 135 491ZM220 489C220 485 213 483 205 486 197 490 190 496 190 501 190 505 197 507 205 504 213 500 220 494 220 489ZM95 595C93 591 97 579 105 568 118 550 121 550 135 565 144 574 148 586 145 592 137 605 103 607 95 595Z", 
              symbolRepeat = TRUE,bg='red') %>% 
  e_theme("westeros") %>%
  e_title("People Icons") %>% 
  e_flip_coords() %>%
  # Hide Legend
  e_legend(show = FALSE) %>%
  # Remove Gridlines
  e_x_axis(splitLine=list(show = FALSE)) %>%
  e_y_axis(splitLine=list(show = FALSE)) %>%
  # Format Label
  e_labels(fontSize = 16, fontWeight ='bold', position = "right", offset=c(10, 0))
```


unit chart plus libre

Comme à chaque fois, commençons par charger le tidyverse.


Installation du package waffle. Attention, il est important ici d'installer la version la plus récente qui n'est pas sur le CRAN.


```{r}
#install.packages("waffle", repos = "https://cinc.rud.is")
```

vérifier que vous avez une version suffisamment avancée (supérieure à 1.0).

```{r}
packageVersion("waffle")
```



```{r}
library(waffle)
library(hrbrthemes)
```

le premier gaphe un diagramme en gaufre simple prenons des données


```{r}
xdf<- data.frame(
  parts = factor(rep(month.abb[1:3], 3), levels=month.abb[1:3]),
  vals = c(10, 20, 30, 6, 14, 40, 30, 20, 10),
  col = rep(c("blue", "black", "red"), 3),
  fct = c(rep("Thing 1", 3),
          rep("Thing 2", 3),
          rep("Thing 3", 3)))
xdf
```

table de fréquence

```{r}
tab_xdf<-xdf %>%
  count(parts, wt = vals)
tab_xdf
```

établissons le graphe

```{r}
ggplot(data=tab_xdf) + aes(fill = parts, values = n)+
  geom_waffle(n_rows = 20, size = 0.33, colour = "white", flip = TRUE) +
  scale_fill_manual(
    name = NULL,
    values = c("#a40000", "#c68958", "#ae6056"),
    labels = c("Fruit", "Sammich", "Pizza")) +
  coord_equal()
```


```{r}
ggplot(data=tab_xdf) + aes(fill = parts, values = n) +
  geom_waffle(n_rows = 20, size = 0.33, colour = "white", flip = TRUE) +
  scale_fill_manual(name = NULL,
                    values = c("#a40000", "#c68958", "#ae6056"),
                    labels = c("Fruit", "Sammich", "Pizza")) +
  coord_equal() +
  theme_ipsum_rc(base_family='sans',grid="") +
  theme_enhance_waffle()
```


```{r}
ggplot(data=tab_xdf) + aes(fill = parts, values = n) +
  geom_waffle(n_rows = 20, size = 0.33, colour = "white", flip = TRUE) +
  scale_fill_manual(name = NULL,
                    values = c("#a40000", "#c68958", "#ae6056"),
                    labels = c("Fruit", "Sammich", "Pizza")) +
  coord_equal() +
  theme_modern_rc(base_family='sans',grid="") +
  theme_enhance_waffle()
```

```{r}
ggplot(data=tab_xdf) + aes(fill = parts, values = n) +
  geom_waffle(n_rows = 20, size = 0.33, colour = "white", flip = TRUE) +
  scale_fill_manual(name = NULL,
                    values = c("#a40000", "#c68958", "#ae6056"),
                    labels = c("Fruit", "Sammich", "Pizza")) +
  coord_equal() +
  theme_ft_rc(base_family='sans',grid="") +
  theme_enhance_waffle()
```




```{r}
ggplot(data=tab_xdf) + aes(fill = parts, values = n) +
  geom_waffle(n_rows = 20, size = 0.33, colour = "white", flip = TRUE) +
  scale_fill_manual(name = NULL,
                    values = c("#a40000", "#c68958", "#ae6056"),
                    labels = c("Fruit", "Sammich", "Pizza")) +
  coord_cartesian() +
  theme_ipsum_rc(base_family='sans',grid="") +
  theme_enhance_waffle()
```




les thèmes 

```{r}
library(showtext)
font_add_google('Roboto Condensed')
showtext_auto()
```


```{r}
ggplot(data=tab_xdf) + aes(fill = parts, values = n) +
  geom_waffle(n_rows = 20, size = 0.33, colour = "white", flip = TRUE) +
  scale_fill_manual(name = NULL,
                    values = c("#a40000", "#c68958", "#ae6056"),
                    labels = c("Fruit", "Sammich", "Pizza")) +
  coord_equal() +
  theme_ipsum_rc(grid="") +
  theme_enhance_waffle()
```

L isotype préalable avant de faire avec des icones est de charger les polices 
associées

https://raw.githubusercontent.com/FortAwesome/Font-Awesome/master/webfonts/fa-solid-900.ttf
https://raw.githubusercontent.com/FortAwesome/Font-Awesome/master/webfonts/fa-regular-400.ttf
https://raw.githubusercontent.com/FortAwesome/Font-Awesome/master/webfonts/fa-brands-400.ttf

```{r}
library(showtext)
font_add(family = "FontAwesome5Free-Solid",
         regular = "C:\\Users\\ludov\\Downloads\\fa-solid-900.ttf")
font_add(family = "FontAwesome5Free-Regular",
         regular = "C:\\Users\\ludov\\Downloads\\fa-regular-400.ttf")
font_add(family = "FontAwesome5Brands-Regular",
         regular = "C:\\Users\\ludov\\Downloads\\fa-brands-400.ttf")
showtext_auto()
```


lorsque vous 

```{r}
p_1<-ggplot(data=tab_xdf) + aes(label = parts, values = n) +
  geom_pictogram(n_rows = 10, aes(colour = parts),
                 flip = TRUE, make_proportional = TRUE) +
  scale_color_manual(
    name = NULL,
    values = c("#a40000", "#c68958", "#ae6056"),
    labels = c("Fruit", "Sammich", "Pizza")
  ) +
  scale_label_pictogram(
    name = NULL,
    values = c("apple-alt", "bread-slice", "pizza-slice"),
    labels = c("Fruit", "Sammich", "Pizza")
  ) +
  coord_equal() +
  theme_ipsum_rc(grid="") +
  theme_enhance_waffle() +
  theme(legend.key.height = unit(2.25, "line")) +
  theme(legend.text = element_text(size = 10, hjust = 0, vjust = 0.75))
p_1
```


```{r }
fa_list()$x$data[1:10,1:2] 
```




```{r}
fa_grep('ninja')$x$data
```

<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 448 512" width="24" height="24"><path d="M325.4 289.2L224 390.6 122.6 289.2C54 295.3 0 352.2 0 422.4V464c0 26.5 21.5 48 48 48h352c26.5 0 48-21.5 48-48v-41.6c0-70.2-54-127.1-122.6-133.2zM32 192c27.3 0 51.8-11.5 69.2-29.7 15.1 53.9 64 93.7 122.8 93.7 70.7 0 128-57.3 128-128S294.7 0 224 0c-50.4 0-93.6 29.4-114.5 71.8C92.1 47.8 64 32 32 32c0 33.4 17.1 62.8 43.1 80-26 17.2-43.1 46.6-43.1 80zm144-96h96c17.7 0 32 14.3 32 32H144c0-17.7 14.3-32 32-32z"/></svg>


```{r}
p_2<-ggplot(data=tab_xdf) + aes(label = parts, values = n) +
  geom_pictogram(n_rows = 10, aes(colour = parts),
                 flip = TRUE, make_proportional = TRUE) +
  scale_color_manual(
    name = NULL,
    values = c("#a40000", "#c68958", "#ae6056"),
    labels = c("female", "male", "coffee")
  ) +
  scale_label_pictogram(
    name = NULL,
    values = c("female", "male", "coffee"),
    labels = c("female", "male", "coffee")
  ) +
  coord_equal() +
  theme_ipsum_rc(grid="") +
  theme_enhance_waffle() +
  theme(legend.key.height = unit(2.25, "line")) +
  theme(legend.text = element_text(size = 10, hjust = 0, vjust = 0.75))
p_2
```



intégrer plusieurs graphe dans un avec iron


```{r}
parts <- c(80, 30, 20, 10)
w1 <- waffle(parts, rows=8)
w2 <- waffle(parts, rows=8)
w3 <- waffle(parts, rows=8)
# print chart
iron(w1, w2, w3)
```

avec facet

```{r}
tibble(
  parts = factor(rep(month.abb[1:3], 3), levels=month.abb[1:3]),
  values = c(10, 20, 30, 6, 14, 40, 30, 20, 10),
  fct = c(rep("Thing 1", 3), rep("Thing 2", 3), rep("Thing 3", 3))
) -> xdf

ggplot(xdf, aes(fill=parts, values=values)) +
  geom_waffle(color = "white", size=1.125, n_rows = 6) +
  facet_wrap(~fct, ncol=1) +
  scale_x_discrete(expand=c(0,0)) +
  scale_y_discrete(expand=c(0,0)) +
  ggthemes::scale_fill_tableau(name=NULL) +
  coord_equal() +
  labs(
    title = "Faceted Waffle Geoms"
  ) +
  theme_ipsum_rc(grid="") +
  theme_enhance_waffle()
```

en vertical

```{r}
storms %>% 
  filter(year >= 2010) %>% 
  count(year, status) -> storms_df

ggplot(storms_df, aes(fill = status, values = n)) +
  geom_waffle(color = "white", size = .25, n_rows = 10, flip = TRUE) +
  facet_wrap(~year, nrow = 1, strip.position = "bottom") +
  scale_x_discrete() + 
  scale_y_continuous(labels = function(x) x * 10, # make this multiplyer the same as n_rows
                     expand = c(0,0)) +
  ggthemes::scale_fill_tableau(name=NULL) +
  coord_equal() +
  labs(
    title = "Faceted Waffle Bar Chart",
    subtitle = "{dplyr} storms data",
    x = "Year",
    y = "Count"
  ) +
  theme_minimal(base_family = "Roboto Condensed") +
  theme(panel.grid = element_blank(), axis.ticks.y = element_line()) +
  guides(fill = guide_legend(reverse = TRUE))
```



























