# Linux

## Objetivo

Aprender comandos básicos del sistema operativo Linux para aplicarlos en análisis genómico.

## ¿Qué es linux?

Un SO es un conjunto de órdenes y programas que controlan los procesos básicos de una computadora y permiten el funcionamiento de otros programas.

Linux es un sistema operativo (SO) diseñado por cientos de programadores de todo el planeta. El principal responsable del proyecto es Linus Tovalds.

Su principal objetivo es impulsar el software de libre distribución junto con su código fuente para que pueda ser modificado por cualquier persona.

<p align="center">
  <img src="https://github.com/Martinez-Gregorio-Hector/AnalisisGenomico-EcologiaFESIztacala/blob/main/Unidad1/Figuras/Timeline_of_OS.jpg? raw=true" alt="shell" width="800" height="700">
</p>



## ¿Por qué usar Linux y no Windows?

| Ventajas de usar Windows                  | Ventajas de usar Linux                                                      |
| ----------------------------------------- | --------------------------------------------------------------------------- |
| 1\. Es fácil de Usar                      | 1\. Software de libre distribución                                          |
| 2\. Amplio catálogo de software comercial | 2\. Aprovechamiento de hardware                                             |
| 3\. Compatibilidad de hardware            | 3\. Es seguro y fiable                                                      |
|                                           | 4\. Completamente personalizable                                            |
|                                           | 5\. Modular                                                                 |
|                                           | 6\. Su desarrollo es independiente a los intereses de grandes corporaciones |
|                                           | 7\. Multitarea y multiusuario                                               |
|                                           | 8\. Administrador de paquetes                                               |

## Hardware y software

Hardware: Conjunto de elementos físicos o materiales que constituyen una computadora

Software: Programas para realizar determinadas tareas. 

<p align="center">
  <img src="https://github.com/Martinez-Gregorio-Hector/AnalisisGenomico-EcologiaFESIztacala/blob/main/Unidad1/Figuras/Hardware_Software.jpg? raw=true" alt="shell" width="800" height="300">
</p>




## Kernel

El kernel es el componente de software encargado de controlar la computadora (hardware). 

Controla el acceso a cada recurso (memoria, CPU, disco duro, tarjeta de vídeo).

Ordena el acceso a la(s) CPU(s) de los programas.

## Shell

El Shell permite interactuar con el sistema (vía el kernel).

Lee los comandos tecleados por el usuario y los ejecuta.

El shell puede servir como base para escribir scripts (tareas más complejas).

Existen varios Shell disponibles (lista no exhaustiva): 
* Bourne shell (sh) 
* Korn shell (ksh) 
* C shell (csh)
* Bash shell (bash) 
* Z shell (zsh)


<p align="center">
  <img src="https://github.com/Martinez-Gregorio-Hector/AnalisisGenomico-EcologiaFESIztacala/blob/main/Unidad1/Figuras/shell.jpg?raw=true" alt="shell" width="300" height="300">
</p>

## Bash

Las flechas ↑ y ↓ permiten navegar dentro del historial de los comandos. 

La tecla ”tabulador” [TAB] permite auto-completar los nombres de los archivos y/o comandos. 

Gestión de procesos en segundo plano (background).

## Sistema de archivos

El sistema de archivos representa el método con el cual el sistema operativo organiza los datos. 

Incluye los archivos, y tambien los directorios ( o carpetas)

El referencial de todo el sistema de archivo de una máquina es el caracter “/" 

## Estructura de Linux

<p align="center">
  <img src="https://github.com/Martinez-Gregorio-Hector/AnalisisGenomico-EcologiaFESIztacala/blob/main/Unidad1/Figuras/EstructuraDeLinux.jpg?raw=true" alt="shell" width="1000" height="350">
</p>

## Tengo una PC que corre windows, ¿cómo puedo correr Linux en mi máquina? 

### Puedes instalar Linux en una nueva partición (Lo más recomendable).
Descargas gratuitas de distribuciones desde: 
* [Ubuntu 22.04.1](https://ubuntu.com/download/desktop)
* [Centos](https://www.centos.org/download)
* [Fedora](http://fedoraproject.org/es/get-fedora)

## Puedes instalar MobaXterm
[MobaXterm](https://mobaxterm.mobatek.net/download.html ) proporciona una terminal para Windows con un servidor de ambiente gráfico X11, un cliente SSH para establecer sesiones remotas seguras con un servidor, diversas herramientas de red y más. 

### Otras opciones

* Usar la terminal en entorno de Windows 10. Acceder a la terminal y comunicarnos con el servidor.
* Usar Rstudio, en la pestaña tools, seleccionar terminal. Acceder y comunicarnos con el servidor.

### Usaremos el servidor de la UNAM (no acceder después del curso)

## Conexión remota al servidor

### ssh lab13@132.248.216.138
La contraseña y el acceso al directorio se te proporcionará en el curso




