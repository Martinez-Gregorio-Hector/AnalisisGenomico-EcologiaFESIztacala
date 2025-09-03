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
flights
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

```
filter(flights, month == 1, day == 1)
```

Cuando ejecuta esa línea de código, dplyr ejecuta la operación de filtrado y devuelve un nuevo marco de datos. Las funciones de dplyr nunca modifican sus entradas, por lo que si desea guardar el resultado, deberá usar el operador de asignación, <-:

```
jan1 <- filter(flights, month == 1, day == 1)
```

R imprime los resultados o los guarda en una variable. Si desea hacer ambas cosas, puede encerrar la asignación entre paréntesis:

```
(dec25 <- filter(flights, month == 12, day == 25))
```

## Comparaciones

Para usar el filtrado eficazmente, es necesario saber cómo seleccionar las observaciones deseadas mediante los operadores de comparación. R ofrece los operadores estándar: >, >=, <, <=, != (distinto) y == (igual).


## Operadores lógicos

Los argumentos múltiples de **filter()** se combinan con "y": cada expresión debe ser verdadera para que una fila se incluya en la salida. Para otros tipos de combinaciones, deberá usar operadores booleanos: & es "y", | es "o" y ! es "no". 

El siguiente código busca todos los vuelos que salieron en noviembre o diciembre:


```
filter(flights, month == 11 | month == 12)
```

El orden de las operaciones no funciona como en español. No se puede escribir filter(flights, month == (11 | 12)), que literalmente se podría traducir como "busca todos los vuelos que salieron en noviembre o diciembre". En su lugar, busca todos los meses que sumen 11 | 12, una expresión que se evalúa como VERDADERO. En un contexto numérico (como aquí), VERDADERO se convierte en uno, por lo que se buscan todos los vuelos de enero, no de noviembre ni de diciembre. ¡Esto es bastante confuso!

Una abreviatura útil para este problema es x %in% y. Esto seleccionará todas las filas donde x sea uno de los valores de y. Podríamos usarla para reescribir el código anterior:

```
nov_dec <- filter(flights, month %in% c(11, 12))
```

A veces se puede simplificar la subdivisión compleja recordando la ley de De Morgan: !(x e y) es igual a !x | !y, y !(x | y) es igual a !x e !y. Por ejemplo, si se desea encontrar vuelos con un retraso (de llegada o salida) de más de dos horas, se puede usar uno de los dos filtros siguientes:

```
filter(flights, !(arr_delay > 120 | dep_delay > 120))
filter(flights, arr_delay <= 120, dep_delay <= 120)
```

## Ejercicio

Encuentra todos los vuelos que 

1. tuvieron un retraso de llegada (arrival delay) de dos o más horas
2. Volaron a Houston (IAH o HOU)
3. Salieron en verano (julio, agosto y septiembre)
4. Llegaron con más de dos horas de retraso, pero no salieron tarde
5. Tuvieron un retraso de al menos una hora, pero recuperaron más de 30 minutos en el vuelo
6. Salieron entre la medianoche y las 6 a. m. (inclusive)

## Organizar filas con arrange()

**arrange()** funciona de forma similar a **filter()*, excepto que, en lugar de seleccionar filas, cambia su orden. Requiere un datafreama y un conjunto de nombres de columna (o expresiones más complejas) para ordenar. Si se proporciona más de un nombre de columna, cada columna adicional se usará para deshacer los empates en los valores de las columnas anteriores:

```
arrange(flights, year, month, day)
```

## Seleccionar columnas con select()

No es raro obtener conjuntos de datos con cientos o incluso miles de variables. En este caso, el primer desafío suele ser centrarse en las variables que realmente interesan. **select()** permite ampliar rápidamente un subconjunto útil mediante operaciones basadas en los nombres de las variables.

**select()** no es muy útil con los datos de vuelos, ya que solo tenemos 19 variables, pero aun así se puede tener una idea general:


```
# Select columns by name
select(flights, year, month, day)
# Seleccionar todas las columnas entre año y día (inclusive)
select(flights, year:day)
# Seleccionar todas las columnas excepto las de año a día (inclusive)
select(flights, -(year:day))
```

Hay varias funciones auxiliares que puedes usar dentro de select():

* starts_with("abc"): busca nombres que empiezan por "abc".

* ends_with("xyz"): busca nombres que terminan por "xyz".

* contains("ijk"): busca nombres que contienen "ijk".

* matches("(.)\\1"): selecciona variables que coinciden con una expresión regular. Esta coincide con cualquier variable que contenga caracteres repetidos.
  
* num_range("x", 1:3): busca x1, x2 y x3.

Consulta ?select para más detalles.

**select()** puede usarse para renombrar variables, pero rara vez es útil porque omite todas las variables no mencionadas explícitamente. En su lugar, usa rename(), que es una variante de select() que conserva todas las variables no mencionadas explícitamente.

```
rename(flights, tail_num = tailnum)
```

Otra opción es usar **select()** junto con el asistente **everything()**. Esto es útil si tiene varias variables que desea mover al inicio del marco de datos.

```
select(flights, time_hour, air_time, everything())
```
## Ejercicio

1. Piensa en todas las maneras posibles de seleccionar dep_time, dep_delay, arr_time y arr_delay de los vuelos.

2. ¿Qué ocurre si se incluye el nombre de una variable varias veces en una llamada a select()?

3. ¿Qué hace la función any_of()? ¿Por qué podría ser útil junto con este vector?

```
rename(flights, tail_num = tailnum)
```

## Añadir nuevas variables con mutate()

Además de seleccionar conjuntos de columnas existentes, suele ser útil añadir nuevas columnas que sean funciones de columnas existentes. Esa es la función de mutate().

**mutate()** siempre añade nuevas columnas al final del conjunto de datos, así que comenzaremos creando un conjunto de datos más reducido para poder ver las nuevas variables. Recuerda que, en RStudio, la forma más sencilla de ver todas las columnas es View().

```
flights_sml <- select(flights, 
  year:day, 
  ends_with("delay"), 
  distance, 
  air_time
)

mutate(flights_sml,
  gain = dep_delay - arr_delay,
  speed = distance / air_time * 60
)
```

Tenga en cuenta que puede hacer referencia a las columnas que acaba de crear:

```
mutate(flights_sml,
  gain = dep_delay - arr_delay,
  hours = air_time / 60,
  gain_per_hour = gain / hours
)
```

Si solo desea conservar las nuevas variables, utilice transmute():


```
transmute(flights,
  gain = dep_delay - arr_delay,
  hours = air_time / 60,
  gain_per_hour = gain / hours
)
```

## Resúmenes agrupados con summarise()

El último verbo clave es "summarise()". Convierte un marco de datos en una sola fila:

```
summarise(flights, delay = mean(dep_delay, na.rm = TRUE))
```

summarise() no es muy útil a menos que se combine con group_by(). Esto cambia la unidad de análisis del conjunto de datos completo a grupos individuales. Entonces, al usar los verbos dplyr en un marco de datos agrupado, se aplicarán automáticamente "por grupo". Por ejemplo, si aplicamos exactamente el mismo código a un marco de datos agrupado por fecha, obtenemos el retraso promedio por fecha:


```
by_day <- group_by(flights, year, month, day)
summarise(by_day, delay = mean(dep_delay, na.rm = TRUE))
```

Juntos, group_by() y summarise() proporcionan una de las herramientas que usarás con más frecuencia al trabajar con dplyr: los resúmenes agrupados. Pero antes de continuar, necesitamos presentar una nueva y poderosa idea: la tubería.

## Combinación de múltiples operaciones con la tubería

Imagina que quieres explorar la relación entre la distancia y el retraso promedio para cada ubicación. Con lo que sabes sobre dplyr, podrías escribir código como este:

```
by_dest <- group_by(flights, dest)
delay <- summarise(by_dest,
  count = n(),
  dist = mean(distance, na.rm = TRUE),
  delay = mean(arr_delay, na.rm = TRUE)
)
delay <- filter(delay, count > 20, dest != "HNL")

# It looks like delays increase with distance up to ~750 miles 
# and then decrease. Maybe as flights get longer there's more 
# ability to make up delays in the air?
ggplot(data = delay, mapping = aes(x = dist, y = delay)) +
  geom_point(aes(size = count), alpha = 1/3) +
  geom_smooth(se = FALSE)
#> `geom_smooth()` using method = 'loess' and formula = 'y ~ x'
```

Hay tres pasos para preparar estos datos:

Agrupar vuelos por destino.

Resumir para calcular la distancia, el retraso promedio y el número de vuelos.

Filtrar para eliminar los puntos ruidosos y el aeropuerto de Honolulu, que está casi el doble de lejos que el aeropuerto más cercano.

Escribir este código es un poco frustrante porque tenemos que asignar un nombre a cada trama de datos intermedia, aunque no nos importe. Nombrar las cosas es difícil, lo que ralentiza nuestro análisis.

Hay otra forma de abordar el mismo problema con la tubería, %>%:

```
delays <- flights %>% 
  group_by(dest) %>% 
  summarise(
    count = n(),
    dist = mean(distance, na.rm = TRUE),
    delay = mean(arr_delay, na.rm = TRUE)
  ) %>% 
  filter(count > 20, dest != "HNL")
```

Esto se centra en las transformaciones, no en lo que se transforma, lo que facilita la lectura del código. Se puede interpretar como una serie de instrucciones imperativas: agrupar, resumir y filtrar. Como sugiere esta lectura, una buena forma de pronunciar %>% al leer código es "then".

En segundo plano, x %>% f(y) se convierte en f(x, y), y x %>% f(y) %>% g(z) se convierte en g(f(x, y), z), y así sucesivamente. Se puede usar la tubería para reescribir múltiples operaciones de forma que se pueda leer de izquierda a derecha y de arriba a abajo. De ahora en adelante, usaremos la tubería con frecuencia porque mejora considerablemente la legibilidad del código, y la abordaremos con más detalle en las tuberías.

Trabajar con la tubería es uno de los criterios clave para pertenecer al universo de tidy. La única excepción es ggplot2: se escribió antes de que se descubriera la tubería. Lamentablemente, la próxima iteración de ggplot2, ggvis, que sí utiliza la tubería, aún no está lista para su lanzamiento.

## Valores faltantes

Quizás te hayas preguntado sobre el argumento na.rm que usamos anteriormente. ¿Qué ocurre si no lo configuramos?

```
flights %>% 
  group_by(year, month, day) %>% 
  summarise(mean = mean(dep_delay))
```

¡Obtenemos muchos valores faltantes! Esto se debe a que las funciones de agregación siguen la regla habitual de valores faltantes: si hay algún valor faltante en la entrada, la salida también lo será. Afortunadamente, todas las funciones de agregación tienen un argumento na.rm que elimina los valores faltantes antes del cálculo:

```
flights %>% 
  group_by(year, month, day) %>% 
  summarise(mean = mean(dep_delay, na.rm = TRUE))
```

En este caso, donde los valores faltantes representan vuelos cancelados, también podríamos solucionar el problema eliminando primero los vuelos cancelados. Guardaremos este conjunto de datos para poder reutilizarlo en los próximos ejemplos.


```
not_cancelled <- flights %>% 
  filter(!is.na(dep_delay), !is.na(arr_delay))

not_cancelled %>% 
  group_by(year, month, day) %>% 
  summarise(mean = mean(dep_delay))
```


