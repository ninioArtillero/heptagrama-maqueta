# Propuesta de automatización de maquetado para la revista Heptagrama

Esta propuesta tiene el siguiente flujo:
1. Los autores envían sus textos como documentos `.md`, utilizando [_Markdown_](https://pandoc.org/MANUAL.html#pandocs-markdown) para especificar el formato.
   1. Junto a su texto es necesario incluir un archivo `.bib` con la bibliografía en formato biblatex.
1. Utilizando el software [Pandoc](https://pandoc.org) una misma fuente se renderiza a diversos formatos de salid. Aquí ejemplificados: PDF, HTML y DOCX. 
   1. La maqueta se elabora para los formatos intermedios: hay una para LaTex y otra para HTML. Se encuentran en el directorio `pandoc/`.

El desarrollo de esta propuesta consta de los siguientes pasos:

  * [x] Importar maqueta del ICLC[^1]
  * [x] Crear repositorio con introducción a la propuesta
  * [ ] Adaptar la maqueta al diseño de Heptagrama
  * [ ] Automatizar el procesamiento del material del autor
  * [ ] Elaborar un manual para autores

## Build

Desde este directorio ejecutar `make` para producir 4 documentos:  **articulo-xelatex.pdf**, **articulo-pdflatex.pdf**, **articulo.docx** y **articulo.html**.
Para borrarlos ejecutar `make clean`.

El `make` (definido en la Makefile) toma como fuente todos los archivos Markdown (`*.md`) contenidos en el directorio `src`.
Se puede decir que pega todos estos archivos, en orden lexicográfico, y produce el documento a partir de este resultado.

### Dependencias

Para producir los documentos pdf es necesario instalar lo siguiente:

* Pandoc. [Instrucciones oficiales de instalación](http://pandoc.org/installing.html).
  * MacOS: Se recomienda utilizar el administrador de paquetes [Homebrew](http://brew.sh/). Correr `brew update` en la terminal y en seguida `brew install pandoc`.
  * Windows: Se recomienda utilizar el administrador de paquetes [Chocolatey](https://chocolatey.org/). Correr en terminal `choco install pandoc`.
  * Linux: usar el administrador de paquetes de la distribución.
* LaTex (se peude instalar de manera similar utilizando los administradores de paquetes antes mencionados):
[MacTeX](https://www.tug.org/mactex/) para MacOS,
[MiKTeX](https://miktex.org/) o [Tex Live](https://www.tug.org/texlive/) para Windows y
[Tex Live](https://www.tug.org/texlive/) para linux.
  * Asegurarse de tener instalado XeTeX en caso de tener una instalación parcial de la distribución de LaTeX (particularmente en el caso de Tex Live en Linux).
* Fuentes:
  * [Linux Libertine](http://www.linuxlibertine.org/index.php?id=91&L=1)
  * [Inconsolata](http://levien.com/type/myfonts/inconsolata.html)

## Uso

Añadir contenido a discreción sin preocuparse por la estructura global del texto, 
modificando cualquier archivo con extensión `.md` en el directorio `src`.
Se puede añadir contenido a un archivo ya existente, o crear uno nuevo.
Todos los temas relacionados con el desarrollo, conceptualización, especificación, implementación, experimentación y
ramificaciones de la librería **Chiltepín** son de relevancia para este artículo.

[^1]: Referencia: [templete del ICLC](https://github.com/iclc/iclc-templates/blob/main/2023/papers/markdown/iclc2023.md).
