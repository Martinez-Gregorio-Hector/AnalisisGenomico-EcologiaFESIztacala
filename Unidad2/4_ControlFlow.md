## Introducción

Existen dos herramientas principales del flujo de control: las **opciones** y los **bucles**. Las opciones, como las sentencias if y las llamadas switch(), permiten ejecutar código diferente según la entrada. Los bucles, como for y while, permiten ejecutar código repetidamente, generalmente con opciones cambiantes. 

## Opciones

La forma básica de una sentencia if en R es la siguiente:

```
if (condition) true_action
if (condition) true_action else false_action
```

Si la condición es VERDADERA, se evalúa la acción verdadera; si la condición es FALSA, se evalúa la acción falsa opcional.

Normalmente, las acciones son sentencias compuestas contenidas dentro de {:

```
grade <- function(x) {
  if (x > 90) {
    "A"
  } else if (x > 80) {
    "B"
  } else if (x > 50) {
    "C"
  } else {
    "F"
  }
}
```


Al usar la forma de un solo argumento sin una sentencia else, if invisiblemente devuelve NULL si la condición es FALSA. Dado que funciones como c() y paste() descartan entradas NULL, esto permite una expresión compacta de ciertas expresiones idiomáticas:

```
greet <- function(name, birthday = FALSE) {
  paste0(
    "Hi ", name,
    if (birthday) " and HAPPY BIRTHDAY"
  )
}
greet("Maria", FALSE)
#> [1] "Hi Maria"
greet("Jaime", TRUE)
#> [1] "Hi Jaime and HAPPY BIRTHDAY"
```

## vectorizado if

Dado que si solo funciona con un único valor VERDADERO o FALSO, podría preguntarse qué hacer si tiene un vector de valores lógicos. El manejo de vectores de valores es tarea de ifelse(): una función vectorizada con vectores de prueba, sí y no (que se reciclarán a la misma longitud):

**ifelse(condición, valor_si_verdadero, valor_si_falso)**

```
x <- 1:10
ifelse(x %% 5 == 0, "XXX", as.character(x))

ifelse(x %% 2 == 0, "even", "odd")
```

Otro equivalente vectorizado es el método más general dplyr::case_when(). Utiliza una sintaxis especial que permite cualquier número de pares condición-vector:

```
x <- 1:10

dplyr::case_when(
  x %% 35 == 0 ~ "fizz buzz",
  x %% 5 == 0 ~ "fizz",
  x %% 7 == 0 ~ "buzz",
  is.na(x) ~ "???",
  TRUE ~ as.character(x)
)
```

## Sentencia switch()

La sentencia switch() está estrechamente relacionada con `if`. Es un equivalente compacto y específico que permite reemplazar código como:

```
x_option <- function(x) {
  if (x == "a") {
    "option 1"
  } else if (x == "b") {
    "option 2" 
  } else if (x == "c") {
    "option 3"
  } else {
    stop("Invalid `x` value")
  }
}
```

con lo más sucinto:

```
x_option <- function(x) {
  switch(x,
    a = "option 1",
    b = "option 2",
    c = "option 3",
    stop("Invalid `x` value")
  )
}
```

El último componente de un switch() siempre debe generar un error, de lo contrario las entradas no coincidentes devolverán NULL de manera invisible:


```
(switch("c", a = 1, b = 2))
#> NULL
```

## Bucles

Los bucles for se utilizan para iterar sobre los elementos de un vector. Su formato básico es el siguiente:

```
for (item in vector) perform_action
```

Para cada elemento del vector, se llama a perform_action una vez, actualizando el valor del elemento cada vez.

```
for (i in 1:3) {
  print(i)
}
```

(Al iterar sobre un vector de índices, se suele usar nombres de variable muy cortos, como i, j o ​​k).

Nota: "for" asigna el elemento al entorno actual, sobrescribiendo cualquier variable existente con el mismo nombre.


```
i <- 100
for (i in 1:3) {}
i
```

Hay dos maneras de terminar un bucle for antes de tiempo:

* **next** sale de la iteración actual.

* **break** sale del bucle for por completo.

```
for (i in 1:10) {
  if (i < 3) 
    next

  print(i)
  
  if (i >= 5)
    break
}
```
