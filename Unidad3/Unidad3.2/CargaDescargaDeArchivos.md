# Descargar secuencias en SRA (Sequence Read Archive)

1. Las instrucciones para este ejercicio vienen de este [link](https://www.ncbi.nlm.nih.gov/sra/docs/sradownload/)
2. Usaremos esta liga para irnos a [SRA](https://www.ncbi.nlm.nih.gov/sra/)
3. Usaremos este artículo como referencia para descargar los [FASTQ](https://www.nature.com/articles/s41698-024-00611-z) que estan depositado en SRA

## Archivos que se descargaran en SRA

Los datos que vamos a descargar están disponibles en el repositorio SRA con los números de acceso: **PRJNA987643** y **PRJNA987641**.

Crear un archivo que se llame **SraAccList.txt** para descargar los archivos FASTQ

```
SRR25023039
SRR25023040
SRR25023041
SRR25023042
```

## Descargar archivos de datos de secuencia utilizando SRA Toolkit

[Instalar SRA toolkit](https://github.com/ncbi/sra-tools/wiki/)

## Descarga de datos públicos

**Prefetch** es una herramienta de la suite SRA. Este programa descarga los conjuntos de datos (archivos de secuencias en formato SRA comprimido) y todos los datos adicionales necesarios para convertirlos a un formato más común. **Prefetch** también permite completar o corregir descargas de datos incompletas.

Utilice el siguiente comando de **Prefetch** para descargar los conjuntos de datos mencionados anteriormente en formato SRA.

Utilice el comando prefetch para descargar los datos de ejecución del ejemplo anterior en formato SRA.

Para un solo dato:

```
$ prefetch SRR000001
```

Para una lista de datos:

```
prefetch --option-file SraAccList.txt
```

Se genera los siguientes datos


<p align="center">  
  <img src="https://github.com/Martinez-Gregorio-Hector/AnalisisGenomico-EcologiaFESIztacala/blob/main/Unidad3/Unidad3.2/SRA.png? raw=true" alt="shell" >
</p>

Unidad3/Unidad3.2/SRA.png

Las herramientas **fasterq-dump** y **sam-dump**, que también forman parte de la suite de herramientas SRA, permiten convertir los datos de ejecución descargados (en formato SRA comprimido) a los formatos FASTQ o SAM. Por ejemplo:

```
fasterq-dump --split-files SRR11180057.sra
```

<p align="center">  
  <img src="https://github.com/Martinez-Gregorio-Hector/AnalisisGenomico-EcologiaFESIztacala/blob/main/Unidad3/Unidad3.2/SRA2.png? raw=true" alt="shell" >
</p>

También puede omitir el paso de descarga previa y realizar la conversión directamente, introduciendo solo el identificador de la ejecución (sin la extensión .sra) en el comando **fasterq-dump** o **sam-dump**:

```
fasterq-dump --split-files SRR25023039
fasterq-dump --split-files SRR25023040
fasterq-dump --split-files SRR25023041
fasterq-dump --split-files SRR25023042
```

## Descargar metadatos asociados a los datos de SRA

Los archivos de ejecución de SRA no contienen información sobre los metadatos (información de la muestra, etc.) vinculados a los datos.

Para descargar los metadatos de cada ejecución de su consulta en Entrez, haga clic en «Enviar a» en la parte superior de la página, seleccione la opción «Archivo» y elija «RunInfo» en el menú desplegable.

Esto generará un archivo tabular SraRunInfo.csv con los metadatos disponibles para cada ejecución.

Desde el selector de ejecuciones
Puede descargar un conjunto ligeramente diferente de metadatos en un archivo delimitado por tabulaciones desde la imagen externa del selector de ejecuciones.

Para descargar los metadatos de cada ejecución de su consulta en Entrez:

Haga clic en **send to** en la parte superior de la página, seleccione la opción **Run Selector**  y haga clic en **go**
Si es necesario, refine los resultados utilizando los filtros disponibles en la interfaz del selector de ejecuciones.

<p align="center">  
  <img src="https://github.com/Martinez-Gregorio-Hector/AnalisisGenomico-EcologiaFESIztacala/blob/main/Unidad3/Unidad3.2/SRA_info.png? raw=true" alt="shell" >
</p>


Haga clic en el botón «Metadata». Esto generará un archivo tabular SraRunTable.csv con los metadatos disponibles para cada ejecución.


<p align="center">  
  <img src="https://github.com/Martinez-Gregorio-Hector/AnalisisGenomico-EcologiaFESIztacala/blob/main/Unidad3/Unidad3.2/SRA_metadata.png? raw=true" alt="shell" >
</p>


## Descargar datos de secuencia desde el navegador de ejecuciones

La herramienta de visualización de ejecuciones [Run Browser](https://www.ncbi.nlm.nih.gov/Traces/index.html?view=run_browser&display=metadata) permite la descarga limitada (una ejecución a la vez, con menos de 5 Gb de secuencia, mediante HTTP) de datos de secuencia en formato FASTA o FASTQ.

Ejemplo de descarga:

1. Abra el navegador de ejecuciones [Run Browser](https://www.ncbi.nlm.nih.gov/Traces/index.html?view=run_browser&display=metadata)
2. Introduzca el número de acceso, por ejemplo, SRR25023039
3. Para filtrar las secuencias, introduzca un criterio de búsqueda en el campo de filtro (o bien, deje el campo vacío).
4. Seleccione la ejecución que desea descargar y, opcionalmente, seleccione «Filtrada» o «Recortada». A continuación, haga clic en el botón FASTA o FASTQ para descargar los datos en ese formato.


