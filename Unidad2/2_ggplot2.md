# Visualización de datos usando gramática de ggplot2

## Introducción

* En la mayor parte de los lenguajes de programación, la capacidad para crear gráficos las proporcionan librerias adicionales, **ajenas a su núcleo**.

* En R, los gráficos son nativos

* En R existe dos motores gráficos:

   * Funciones de alto nivel (**plot, hist, barplot, boxplot**) que a su vez invocan funciones de bajo nivel que nos permiten hacer modificaciones en los gráficos.
   * 
   * grid. Creado por Paul Murell para facilitar la generación de gráficos tipo Trellis, de celosía o de pequeños múltiplos
     
      * lattice, ggplot2
    
## ggplot2

* Es una librería de R implementada por Hadley Wickham para visualización de datos

* Forma parte de un conjunto de librerías llamado tidyverse

* ggplot2 esta basado en "The grammar of Graphics" de Leland Wilkinson (2000)

* Tiene más de 10 años y es usado por miles de personas en todo el mundo
  
    * Ventaja: Hay muchas comunidades que te ayudan a resolver dudas
 

## The grammar of graphics 

* Pone una serie de ideas novedosas de como se debe generar un gráfico

* La udea central es:
  
   * Todos los gráficos pueden generarse mediante un lenguaje regular, con una sintaxis determinada
 
   * Es posible construir una serie de reglas comunes, conocidas y regulares para crear representaciones visuales de datos de interés estadístico
 
   * Es un marco que sigue un enfoque en capas para describir y construir visualizaciones o gráficos de manera estructurada
 
## Instalación de ggplot2


```
# Instalando la librería tidyverse completa
install.packages("tidyverse")

# Instalando desde su repositorio de preferencia
install.packages("ggplot2", dependencies = TRUE)

# O instalar la versión en desarrollo desde github
install.packages("devtools")
devtools::install_github("tidyverse/ggplot2")
```

## Repertorio de gráficas 

<p align="center">  
  <img src="https://github.com/Martinez-Gregorio-Hector/AnalisisGenomico-EcologiaFESIztacala/blob/main/Unidad2/FigurasUnidad2/ReportorioGrafica1.png? raw=true" alt="shell" >  
</p>


<p align="center">  
  <img src="https://github.com/Martinez-Gregorio-Hector/AnalisisGenomico-EcologiaFESIztacala/blob/main/Unidad2/FigurasUnidad2/ReportorioGrafica2.png? raw=true" alt="shell" >  
</p>


<p align="center">  
  <img src="https://github.com/Martinez-Gregorio-Hector/AnalisisGenomico-EcologiaFESIztacala/blob/main/Unidad2/FigurasUnidad2/ReportorioGrafica3.png? raw=true" alt="shell" >  
</p>


<p align="center">  
  <img src="https://github.com/Martinez-Gregorio-Hector/AnalisisGenomico-EcologiaFESIztacala/blob/main/Unidad2/FigurasUnidad2/ReportorioGrafica4.png? raw=true" alt="shell" >  
</p>


## Elementos de un gráfico de ggplot

  
<p align="center">  
  <img src="https://github.com/Martinez-Gregorio-Hector/AnalisisGenomico-EcologiaFESIztacala/blob/main/Unidad2/FigurasUnidad2/Elementos.png? raw=true" alt="shell" >  
</p>


## La gramática de la gráfica y ggplot2


<p align="center">  
  <img src="https://github.com/Martinez-Gregorio-Hector/AnalisisGenomico-EcologiaFESIztacala/blob/main/Unidad2/FigurasUnidad2/ParteDeLaGrafica.png? raw=true" alt="shell" >  
</p>


## Funciones principales en ggplot2


* Hay dos funciones principales en ggplot2:

* Una función que nos permite echarle un vistazo rápido a los datos

```
qplot()
```

* Una función más compleja que nos va a permitir explorar más a fondo los datos


```
ggplot()
```

## Sintáxis qplot()

Crea un gráfico completo con los datos, geom y mapeos. Proporciona muchos valores por defecto

```
qplot(x = variable_X, y = variable_Y, color = variable_color, data = data.frame, geom = "point")
```

## ?plot


<p align="center">  
  <img src="https://github.com/Martinez-Gregorio-Hector/AnalisisGenomico-EcologiaFESIztacala/blob/main/Unidad2/FigurasUnidad2/qplot.png? raw=true" alt="shell" >  
</p>

## Datos: mtcars

* Es un dataframe que viene con la librería de ggplot2

* Los datos se extrajeron de la revista de la revista Motor Trend de EE. UU. de 1974

* Comprenden el consumo de combustibles y 10 aspectos del diseño y el rendimiento del autómovil para 32 automóviles (modelo 1973-1974).


Trabajar con el script [2_ggplot2](https://github.com/Martinez-Gregorio-Hector/AnalisisGenomico-EcologiaFESIztacala/blob/main/Unidad2/2_ggplot2.Rmd)


## Sintáxis ggplot2

* Crea un gráfico al que se le añaderan capas. Sin valores por defecto, pero que proporcionan más control


<p align="center">  
  <img src="https://github.com/Martinez-Gregorio-Hector/AnalisisGenomico-EcologiaFESIztacala/blob/main/Unidad2/FigurasUnidad2/ggplot2_structure.png? raw=true" alt="shell" >  
</p>



## Ver la estructura de ggplot2

```
?ggplot
```

<p align="center">  
  <img src="https://github.com/Martinez-Gregorio-Hector/AnalisisGenomico-EcologiaFESIztacala/blob/main/Unidad2/FigurasUnidad2/ggplo2help.png? raw=true" alt="shell" >  
</p>


## Datos

* Los datos son los elementos más importantes de un gráfico

* ggplot2 solo acepta un tipo de datos "data.frames"

* Usaremos los datos de iris (de Fisher o Anderson) de las medidas en centímetros de las variables
  * Longitud y ancho del sépalo
 
  * Largo y ancho del pétalo
 
  * Para 50 flores de cada una de las 3 especies de iris

     * Iris setosa, versicolor y virginica
   
Trabajar con el script [2_ggplot2](https://github.com/Martinez-Gregorio-Hector/AnalisisGenomico-EcologiaFESIztacala/blob/main/Unidad2/2_ggplot2.Rmd)

# Recursos


#### [r-graphics](https://r-graphics.org/)
#### [r-charts](https://r-charts.com/es/)
#### [r-charts-colores](https://r-charts.com/es/colores/)
#### [r-graph](https://r-graph-gallery.com/)
#### [r-statistics](https://r-statistics.co/ggplot2-Tutorial-With-R.html)
#### [positron](https://posit.co/products/ide/positron/)

