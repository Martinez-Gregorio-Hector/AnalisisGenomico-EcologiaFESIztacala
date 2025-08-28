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

Para citar R en alguna publicación basta con usar la función **citation()**. Y para conocer a todo el equipo detrás del desarrollo de R, puedes consultarlo con la función **contributors()**. 

R y RStudio están diseñados para que muchas personas puedan aprenderlo desde cero, con tan solo este primer mensaje todo usuario podría empezar a aprender R; para empezar a aprender R intenta usar la función en tu consola de **help.start()** con el cual se desplegará un menú en HTML con todos los manuales para aprender a usar R, también aparecerán los manuales de todas las paqueterías del repositorio de CRAN (The Comprehensive R archive Network) así como enlaces a noticias del mundo de R.

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

## Primera actividad

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

## Segunda actividad

* Ejecuta el siguiente código:

```
install.packages("ggplot2", dependencies=TRUE)
library(ggplot2)

ggplot(cats, aes(x = Sex)) + 
    geom_bar(fill = "orange", color = "black") + theme_classic() 

```
¿Cómo podemos exportar el gráfico?

Revisar este [link](https://bookdown.org/ndphillips/YaRrr/saving-plots-to-a-file-with-pdf-jpeg-and-png.html)

## Tercera Actividad

* Ejecuta el siguiente código:

```
install.packages("ggThemeAssist", dependencies=TRUE)

g <- ggplot(cats, aes(x = Sex)) + 
    geom_bar(fill = "orange", color = "black") + theme_classic() +
    xlab("Sexo") + ylab("Número de Gatos") + ggtitle("Gatos")

g
```
A continuación selecciona **g**, ve a **Addins** y da click en **ggplot Theme Assistant**. Explora los arreglos de las gráficas que puedes hacer.

## Instalación de librerías

Revisamos que la mayoría de los paquetes de R se almacenan en la Red Integral de Archivos de R (CRAN), el repositorio oficial de paquetes de R. Para instalar un paquete desde CRAN, utilizamos la función **install.packages()**:

```
install.packages("readr")
```

Este comando instala el paquete **readr**, que permite leer archivos CSV y otros formatos de archivo planos. Asegúrese de escribir el nombre del paquete entre comillas.

También puede instalar varios paquetes a la vez pasando un vector de caracteres **(c())**:

```
install.packages(c("readr", "ggplot2", "tidyr"))

```

## Installing R Packages from GitHub


Algunos paquetes de R no están en CRAN, pero sí están disponibles en GitHub. Estos paquetes suelen estar en desarrollo o ofrecen funciones que aún no están disponibles en CRAN.

Para instalar un paquete desde GitHub, use el paquete **{remotes}**:

```
install.packages("remotes")
remotes::install_github("rstudio/shiny")

```

## Instalación de paquetes R desde un archivo local

Si has descargado un paquete a tu ordenador, puedes instalarlo así:

```
install.packages(/Users/YourName/Downloads/abc_2.1.zip", repos = NULL, type = "source")

```

## Instalación de paquetes desde bioconductor

Puedes descargar una librería desde [bioconductor](https://www.bioconductor.org/)

Ejemplo de instalación de [MutationalPattern](https://www.bioconductor.org/packages/release/bioc/html/MutationalPatterns.html)

```
if (!require("BiocManager", quietly = TRUE))
    install.packages("BiocManager")

BiocManager::install("MutationalPatterns")

```

# Flujos de trabajo con proyectos de RStudio

Es un archivo especial de R, compatible con RStudio, que al ejecutarlo hará 3 cosas:

* Abrirá una nueva sesión de RStudio.
  
* Establecerá la ubicación del proyecto como tu directorio de trabajo.
  
* Establecerá la ubicación del proyecto como la raíz de los archivos.

## ¿Cómo generamos un proyecto de RStudio?

Creando un proyecto en un directorio nuevo.

En las opciones de RStudio Ve a **File > New project > New Directory > New Project**.

* Asigna un nombre a tu proyecto, sin espacios y sin caracteres especiales.

* Selecciona la ubicación donde crearás el nuevo directorio.

* Selecciona la opción Open in New Session.
  
* Oprime Create Project.

Crea tres directorio en la carpeta que acabas de crear: **script**, **data**, y **plot**

<p align="center">  
  <img src="https://github.com/Martinez-Gregorio-Hector/AnalisisGenomico-EcologiaFESIztacala/blob/main/Unidad2/FigurasUnidad2/OrganizacionDirectorio.png? raw=true" alt="shell" >
</p>

# Nombre de archivos

Los nombres importan:

* Amigables para computadoras

* Amigables para humanos

* Se ordenan convenientemente

<p align="center">  
  <img src="https://github.com/Martinez-Gregorio-Hector/AnalisisGenomico-EcologiaFESIztacala/blob/main/Unidad2/FigurasUnidad2/NombreDeLosArchivos.png? raw=true" alt="shell" >
</p>

## Amigable para computadoras (no sólo R)

## Es fácil usar expresiones regulares y globbing

* Evitar espacios, puntuación, acentos, caracteres especiales, uso de mayúsculas y minúsculas.

## Es fácil operar sobre ellos

* Usar delimitadores pensando que vamos a extraer componentes (guión bajo _)

## globbing

<p align="center">  
  <img src="https://github.com/Martinez-Gregorio-Hector/AnalisisGenomico-EcologiaFESIztacala/blob/main/Unidad2/FigurasUnidad2/globbing.png? raw=true" alt="shell" >
</p>

## Expresiones regulares

<p align="center">  
  <img src="https://github.com/Martinez-Gregorio-Hector/AnalisisGenomico-EcologiaFESIztacala/blob/main/Unidad2/FigurasUnidad2/ExpresionesRegulares.png? raw=true" alt="shell" >
</p>

## Es fácil operar sobre ellos 

<p align="center">  
  <img src="https://github.com/Martinez-Gregorio-Hector/AnalisisGenomico-EcologiaFESIztacala/blob/main/Unidad2/FigurasUnidad2/ExpresionesRegulares2.png? raw=true" alt="shell" >
</p>

## Amigables para humanos

Los nombres contienen información

Los nombres dan contexto

Mismo concepto que el slug en los URLs amigables al usuarion

##  Se ordenan convenientemente

Incluye un componente numérica

Incluye ceros para tener una longitud constante, un orden ventajoso

Usa el estándar ISO 8601 para fechas: aaaa-mm-dd

## Guías

* Evitar espacios, puntuación, acentos, caracteres especiales, uso de mayúsculas y minúsculas

* Usar guiones bajos _ para separar metadatos que podré extraer después

* Usar guiones altos para delimitar palabras y que sean fácil de leer

* aaaa-mm-dd o algun componente numérico que facilite ordenar


  


