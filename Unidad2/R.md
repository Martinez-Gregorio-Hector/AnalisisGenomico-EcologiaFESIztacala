# R

## Objetivo

Aprender comandos básicos de R para aplicarlos en análisis genómico y estadístico.

## Inicio

Para poder usar RStudio tenemos que tener instalado R en nuestras máquinas. Si aún no lo has instalado lo puedes descargar desde el siguiente link https://cran.itam.mx. Descargar la versión más reciente.

También necesitas descargar la versión más reciente de RStudio [Desktop](https://posit.co/download/rstudio-desktop/).

## Misión de R

“La misión de RStudio es crear software gratuito y de código abierto para ciencia de datos, investigación científica y comunicación técnica. Hacemos esto para mejorar la producción y el consumo de conocimiento por parte de todos, independientemente de los medios económicos, y para facilitar la colaboración y la investigación reproducible, las cuales son críticas”

## Primeros consejos para iniciar

Al abrir RStudio la consola nos arroja el mensaje que se muestra a continuación en la imagen. En este mensaje nos indica la versión de R que tenemos instalada y la plataforma en la que estamos trabajando. 

Para citar R en alguna publicación basta con usar la función citation(). Y para conocer a todo el equipo detrás del desarrollo de R, puedes consultarlo con la función contributors(). 

R y RStudio están diseñados para que muchas personas puedan aprenderlo desde cero, con tan solo este primer mensaje todo usuario podría empezar a aprender R; para empezar a aprender R intenta usar la función en tu consola de help.start() con el cual se desplegará un menú en HTML con todos los manuales para aprender a usar R, también aparecerán los manuales de todas las paqueterías del repositorio de CRAN (The Comprehensive R archive Network) así como enlaces a noticias del mundo de R.

<p align="center">
  <img src="https://github.com/Martinez-Gregorio-Hector/AnalisisGenomico-EcologiaFESIztacala/blob/main/Unidad2/FigurasUnidad2/RStudio1.png? raw=true" alt="shell" width="600" height="400">
</p>

## La interfaz gráfica de RStudio

RStudio es un entorno de desarrollo integrado (IDE) para R. Su interfaz gráfica incluye 3 paneles principales:

* Consola de R
* Datos en el ambiente, Historial, Conecciones remotas, Git.
* Gráficos, Archivos, Ayuda, Paqueterías

<p align="center">
  <img src="https://github.com/Martinez-Gregorio-Hector/AnalisisGenomico-EcologiaFESIztacala/blob/main/Unidad2/FigurasUnidad2/RStudio2.png? raw=true" alt="shell" width="600" height="300">
</p>

## Opciones globales

Las opciones globales (Global Options…) nos permitirán cambiar aspectos visuales de la organización de la interfaz gráfica. Para acceder a estas opciones debemos ir a **Tools > Global Options**.

### Actividades

1. Explora el menú de **Global Options**

## Archivos de RStudio

En RStudio podemos generar todos los archivos enlístados en “New File”. El archivo más usado para desarrollar código en R es **R Script**. Aún así RStudio nos permite hacer reportes de nuestros código con **R Notebook** y **R Markdown**, aplicaciones web con **Shiny Web App**, generar APIs con **Plumber API**, editar código en **HTML**, **C**, **C++**, **Python**, **CSS**, **JavaScript**, **Shell**, entre otros.

<p align="center">
  <img src="https://github.com/Martinez-Gregorio-Hector/AnalisisGenomico-EcologiaFESIztacala/blob/main/Unidad2/FigurasUnidad2/RStudio3.png? raw=true" alt="shell" width="600" height="300">
</p>

## Trabajando con environment

### Primera actividad

* Crear un **R scripts**. 
* En un script ejecuta el siguiente código:

```
install.packages("MASS", dependencies=TRUE)

library(MASS)

data(cats)
View(cats)

table(cats$Sex)
```
¿Qué sucede al ejecutar data(cats) y View(cats)?

¿Qué formas hay desde la interfaz gráfica para importar datos?

### Segunda actividad

* Ejecuta el siguiente código:

```
install.packages("ggplot2", dependencies=TRUE)
library(ggplot2)

ggplot(cats, aes(x = Sex)) + 
    geom_bar(fill = "orange", color = "black") + theme_classic() 

```
¿Cómo podemos exportar el gráfico?

### Tercera Actividad

* Ejecuta el siguiente código:

```
install.packages("ggThemeAssist", dependencies=TRUE)

g <- ggplot(cats, aes(x = Sex)) + 
    geom_bar(fill = "orange", color = "black") + theme_classic() +
    xlab("Sexo") + ylab("Número de Gatos") + ggtitle("Gatos")

g
```
A continuación selecciona **g**, ve a **Addins** y da click en **ggplot Theme Assistant**. Explora los arreglos de las gráficas que puedes hacer.
