La visualización es una herramienta importante para la generación de información, pero rara vez se obtienen los datos exactamente en el formato necesario. A menudo, será necesario crear nuevas variables o resúmenes, o quizás simplemente desee renombrar las variables o reordenar las observaciones para facilitar el trabajo con los datos. En esta sección, usaremos el paquete de dplyr y datos sobre vuelos que salieron de la ciudad de Nueva York en 2013.


## Prerrequisitos

En esta sección, nos centraremos en el uso del paquete dplyr, otro componente esencial de tidyverse. Ilustraremos las ideas clave utilizando datos del paquete nycflights13 y usaremos ggplot2 para comprender mejor los datos.

```
library(nycflights13)
library(tidyverse)
```

Preste atención al mensaje de conflictos que se imprime al cargar tidyverse. Indica que dplyr sobrescribe algunas funciones en R base. Si desea usar la versión base de estas funciones después de cargar dplyr, deberá usar sus nombres completos: stats::filter() y stats::lag().

## nycflights13

Para explorar los verbos básicos de manipulación de datos de dplyr, utilizaremos nycflights13::flights. Este marco de datos contiene los 336,776 vuelos que salieron de la ciudad de Nueva York en 2013. Los datos provienen de la Oficina de Estadísticas de Transporte de EE. UU. 


```
library(nycflights13)
library(tidyverse)
```

Quizás notes que este marco de datos se imprime de forma ligeramente diferente a otros que hayas usado anteriormente: solo muestra las primeras filas y todas las columnas que caben en una pantalla. (Para ver el conjunto de datos completo, puedes ejecutar View(flights), que abrirá el conjunto de datos en el visor de RStudio). Se imprime de forma diferente porque es un tibble. Los tibbles son dataframes, pero ligeramente modificados para funcionar mejor en tidyverse. 

También habrás notado la fila de abreviaturas de tres (o cuatro) letras debajo de los nombres de las columnas. Estas describen el tipo de cada variable:


* int significa enteros.

* dbl significa dobles o números reales.

* chr significa vectores de caracteres o cadenas.

* dttm significa fecha y hora (fecha + hora).

* lgl significa vectores lógicos que solo contienen VERDADERO o FALSO.

* fctr significa factores, que R utiliza para representar variables categóricas con valores posibles fijos.

* date significa fechas.


## Fundamentos de dplyr

Cinco funciones clave de dplyr que le permiten resolver la gran mayoría de sus desafíos de manipulación de datos:

* Seleccionar observaciones por sus valores **(filter())**.

* Reordenar las filas **(arrange())**.

* Seleccionar variables por sus nombres **(select())**.

* Crear nuevas variables con funciones de variables existentes **(mutate())**.

* Reducir varios valores a un único resumen **(summarise())**.
  
Todas estas funciones se pueden usar junto con **group_by()**, que cambia el alcance de cada función de operar sobre todo el conjunto de datos a operar sobre él grupo por grupo. Estas seis funciones proporcionan los verbos para un lenguaje de manipulación de datos.

Todos los verbos funcionan de manera similar:

* El primer argumento es un dataframe

* Los argumentos subsiguientes describen qué hacer con el dataframe, utilizando los nombres de las variables (sin comillas).

* El resultado es un nuevo marco de datos.

Juntas, estas propiedades facilitan la conexión de varios pasos simples para obtener un resultado complejo. 


## Filtrar filas con filter()

filter() permite crear subconjuntos de observaciones según sus valores. El primer argumento es la dataframe. El segundo argumento y los siguientes son las expresiones que filtran el marco de datos. Por ejemplo, podemos seleccionar todos los vuelos del 1 de enero con:





