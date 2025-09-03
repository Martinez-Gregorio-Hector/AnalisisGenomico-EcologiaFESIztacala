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

