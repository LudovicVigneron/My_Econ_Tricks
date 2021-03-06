---
title: La structure des données
author: Ludovic Vigneron
date: '2021-08-05'
slug: []
categories:
  - R
tags:
  - Exercice
---

Depuis quelques temps déjà, je me suis lancé dans l'écriture d'un manuel de statistiques utilisant R pour la présentation des conceptes et comme outils pratiques pour leur mise en oeuvre. L'idée est qu'une simulation numérique bien pensée rend leur compréhension plus facile que les seuls développements mathématiques (même si le livre en contient sa part). En montrant les choses à partir de petits programmes et en donnant les clès pour librement les modifier, il offre au lecteur la possiblitié d'approcher les mécaniques et leurs limites en les mettant à l'épreuve.

Mais pour ce faire, il est nécessaire de maîtriser un minimum du langage de programmation. Aussi, la première partie du livre est consacrée à sa présentation. Celle-ci s'étale sur plusieurs chapitres. Chacun et d'eux (comme tous ceux du livre) est accompagné d'une série d'exercices mobilisant R. Je profites de ce blog pour rendre le travail de relecture plus amusant en en partageant certains. Je tiendrai biensûr informé le lecture de l'avancé de l'ouvrage (dés que j'aurai trouvé un titre plus percutant qu'"Introduction à la Statisque avec R", promis je fais une annonce...) et de ses futurs débouchés éditoriaux.

En attendant, voyons cela de plus près avec les exercices du chapitre 1 (version actuelle). Pour chacun d'eux, avant d'en reproduire l'énoncé et d'en présenter la résolution, je commencerai par un rappel des notions abordées.

# Exercice 1 : type, mode et la classe d'un objet

R est un langague orienté objet à la structure vectorielle, c'est à dire qu'il s'organise autour d'éléments désignés comme des objets appelés à interagir entre eux pour en former d'autres. L'objet de base, celui qui compose en dernier ressort tous les autres, est le vecteur.

Un vecteur ne peut contenir qu'un type de donnée à la fois. Il en existe cinq différents : "logical", "integer", "double", "complex" et "character" (des éléments binaires VRAI/FAUX, des entiers, des nombres à virgule, des nombres complexes et des lettres). Si un vecteur mélange des données pouvant être reconnu comme pouvant être rattaché à plusieurs types, il adoptera celui du plus détailé. A ce jeu, l'information de type "character" l'emporte sur tout les autres. Si un vecteur est vide, il sera de type "NULL". La fonction **typeof()** permet d'obtenir l'information sur l'objet considéré.

L'information contenue dans un objet est stockée en mémoire selon un format défini de manière à permettre de préserver l'information et limiter la place prise par cette dernière. On a pour les vecteurs en fonction de leur type les modes de stockage suivants (du moins gourmand au plus gourmand en ressources) :

-   logical =\> logical

-   integer et double =\> numeric

-   complex =\> complex

-   character =\> character

Les vecteurs les plus lourds sont les "character". S'ils présentent des régularités , il sera interessant de les convertir en facteurs (avec **as.factor()**) pour réduire leur taille en mémoire. Ils prennent alors le format "numeric". R convertir souvant des vecteurs "character" en facteur lors de leur importation pour traitement à partir d'une source externe. Pour les objets complexes combinant plusieurs type de vecteurs (data.frame, list...), le mode de stockage correspond et "list". La fonction **mode()** permet d'obtenir directement l'information sur le mode de stockage.

Pour les traitements spécifiques, R utilise des objets pouvant être plus complexes que les simples vecteurs (matrix, array, data.frame, list...). Ceux-ci sont regoupés en classes. Chaque classe aura ses propres règles de fontionnement et de présentation. Ainsi, une data.frame regroupe des vecteurs pouvant être de type différents mais qui doivent être de même taille. Une list regoupe des vecteurs de tout type mais pouvant être de tailles de différentes. Une matrix comprendre des vecteurs de mêmes tailles et de mêmes types... Concernant plus spécifiquement les vecteurs seuls, leur classe correspond à leur mode de stockage. La fonction **class()** permet d'obtenir l'information directement.

Il est important de connaître les types, modes et classes des objets manipulés dans vos programes de manière à connaître les opérations qu'il est possible de réaliser sur l'information qu'ils contiennent. Si nécessaire, vous devrez procéder à des transformations pour permettre les traitements que vous envisagez.

Mais tréve de bavardages, voici l'énoncé du premier exercice du livre:

***Identifiez le type, le mode de stockage et la classe des objets suivant:***


```r
A<-c(TRUE,FALSE,FALSE,FALSE,TRUE)
B<-c(1,2.5,10,15,13,0)
C<-c(A,B)
D<-2i
E<-c(C,D)
F<-c(C,"La La La")
```

On pourrait simplement utiliser les fonctions **typeof()**, **mode()** et **class()** pour obtenir directement la réponse mais avant essayons de la déduire des règles que nous venons d'énoncées.

Pour le vecteur A, il n'y a pas de grande difficluté. Il n'est composé que de valeurs logique TRUE/FALSE. Il est donc simplement de type "logical". Il sera stocké également sous forme "logical" dans la mesure où il s'agit de la forme la moins consommatrice en ressources. En temps que vecteur sa classe correspond à son mode de stockage, ce sera donc une nouvelle fois "logical".


```r
A
```

```
## [1]  TRUE FALSE FALSE FALSE  TRUE
```

```r
c(typeof(A),mode(A),class(A))
```

```
## [1] "logical" "logical" "logical"
```

Le vecteur B contient une serie de nombres. Des entiers à l'exception du second 2.5 qui est un nombre décimal. Il est donc de type "double" et est stocké sous la forme "numeric". Sa classe correspond à son mode de stockage et donc "numeric".


```r
B
```

```
## [1]  1.0  2.5 10.0 15.0 13.0  0.0
```

```r
c(typeof(B),mode(B),class(B))
```

```
## [1] "double"  "numeric" "numeric"
```

Le vecteur C correspond à la jonction des vecteurs A et B. Il prend le type du plus complexe des deux (le vecteur B). Il est donc de type "double". Son mode de stockage est en conséquence "numeric" de même que sa classe.


```r
C
```

```
##  [1]  1.0  0.0  0.0  0.0  1.0  1.0  2.5 10.0 15.0 13.0  0.0
```

```r
c(typeof(C),mode(C),class(C))
```

```
## [1] "double"  "numeric" "numeric"
```

Le vecteur D ne présente qu'un seul élément le nombre complexe 2i. Son type est donc "complex" de même que son mode de stockage et sa classe.


```r
D
```

```
## [1] 0+2i
```

```r
c(typeof(D),mode(D),class(D))
```

```
## [1] "complex" "complex" "complex"
```

Le vecteur E correspond à l'adjonction des vecteurs C qui est de type "double" et du vecteur D qui est de type "complex". Il prend le type du plus compliqué des deux. Il est dons de type "complex" et sera stocké selon ce même mode et sera de cette même classe.


```r
E
```

```
##  [1]  1.0+0i  0.0+0i  0.0+0i  0.0+0i  1.0+0i  1.0+0i  2.5+0i 10.0+0i 15.0+0i
## [10] 13.0+0i  0.0+0i  0.0+2i
```

```r
c(typeof(E),mode(E),class(E))
```

```
## [1] "complex" "complex" "complex"
```

Le vecteur F combine le vecteur C, qui est de type "double" (l'adjonction de A qui est "logical" et B qui est "double), et un élément (un vecteur" comprenant le texte "La La La". Il prend le type du vecteur le plus complexe ici le texte. Il est donc de type "character", sera stocké sous ce même mode et sera de cette même classe.


```r
F
```

```
##  [1] "1"        "0"        "0"        "0"        "1"        "1"       
##  [7] "2.5"      "10"       "15"       "13"       "0"        "La La La"
```

```r
c(typeof(F),mode(F),class(F))
```

```
## [1] "character" "character" "character"
```

Voici pour la version actuelle de l'exercice. Je pense à ajouter des questions incluant des variables manquantes NA classiques et des NaN qui marque le résultat d'un calcul qui ne serait pas un nombre (Not a Number). Ceux-ci pourrait être confondus avec chaînes de caractères. On aurait par exemple:


```r
G<-c(2,5.5,6,NA,10,14)
```

Le vecteur G est composé de nombres dont un à virgule. Le NA représentant une valeur manquante qui peut être de tout type. Elle est considérée comme du même type que les autres. Le vecteur est donc de type "double" et est stocké sous format "numeric" et appatient à la classe "numeric".


```r
G
```

```
## [1]  2.0  5.5  6.0   NA 10.0 14.0
```

```r
c(typeof(G),mode(G),class(G))
```

```
## [1] "double"  "numeric" "numeric"
```


```r
H<-c(NA,NaN,NA)
```


```r
H
```

```
## [1]  NA NaN  NA
```

```r
c(typeof(H),mode(H),class(H))
```

```
## [1] "double"  "numeric" "numeric"
```


```r
I<-cbind(B,G)
```


```r
I
```

```
##         B    G
## [1,]  1.0  2.0
## [2,]  2.5  5.5
## [3,] 10.0  6.0
## [4,] 15.0   NA
## [5,] 13.0 10.0
## [6,]  0.0 14.0
```

```r
c(typeof(I),mode(I),class(I))
```

```
## [1] "double"  "numeric" "matrix"  "array"
```


```r
J<-c('A','B','C','A','B+','D')
J<-cbind(B,J)
```


```r
J
```

```
##      B     J   
## [1,] "1"   "A" 
## [2,] "2.5" "B" 
## [3,] "10"  "C" 
## [4,] "15"  "A" 
## [5,] "13"  "B+"
## [6,] "0"   "D"
```

```r
c(typeof(J),mode(J),class(J))
```

```
## [1] "character" "character" "matrix"    "array"
```


```r
K<-1:6
K<-data.frame(J,K)
```


```r
K
```

```
##     B  J K
## 1   1  A 1
## 2 2.5  B 2
## 3  10  C 3
## 4  15  A 4
## 5  13 B+ 5
## 6   0  D 6
```

```r
c(typeof(K),mode(K),class(K))
```

```
## [1] "list"       "list"       "data.frame"
```

# Exercice 2 : calculs sous R

un peu de texte

`\(\sum_{n=1}^{10} n^2\)`
