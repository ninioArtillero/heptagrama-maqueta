---
title: 'Manual de autores'
author:
  - name: Juan Pérez
    affiliation: Rancho electrónico
    email: juanp@rancho.org
  - name: Leona Vicario
    affiliation: Movimiento Independentista
    email: leona.vicario@yahoo.mx
  - name: Xavier Góngora
    affiliation: Universidad Nacional Autónoma de México
    email: xaviergongora.contacto@gmail.com
abstract: |
  Un documento sencillo que ejemplifica el uso de Markdown para la composición de un documento.
---
# Markdown como una opción para editores

Markdown es un lenguaje de "marcado", en el mismo sentido que html: los elementos de su sintaxis nos permiten **indicar el rol de cada objeto** tendrá dentro del texto final.
Sin embargo, a diferencia de este último, Markdown está diseñado para que el texto plano (antes de renderizar) siga siendo legible. Corresponde al paradigma WYSIWIM (_what you see is what i mean_), que
indica de manera declarativa el formato de cada objeto del texto haciendo posible que modifiquemos el resultado de manera consistente sin tener que manipular directamente el texto del autor.

Podemos citar así o así e insertar imágenes utilizando su ubicación relativa. 

![Manos haciendo un gesto de ovación.](img/manos.png)

También podemos insertar código fuente del lenguaje de nuestra preferencia con restaldo automático de sintaxis:

```haskell
factorial :: Int -> Int
factorial 0 = 1
factorial n = n * factorial (n - 1)
```

### Pandoc Markdown

Es recomendable explorar el manual de [Pandoc Markdown](https://pandoc.org/MANUAL.html#pandocs-markdown), pues esta tecnología otorga muchas facilidades para hacer publicaciones profesionales.

Los títulos de sección y subsección se generan utilizando los niveles de _heading_ en Markdown,
`#` y `##` respectivamente.

Si ubicamos las imágenes `./src/img/`. Para invocarlas utilizamos: 

`![descripción detallada de la imagen](img/mi-imagen.extension)`.

La imagen se acomodará en el texto de manera automática.

### Citas

Para añadir cita hacemos lo siguiente:[^citas]

1. Añadir la entrada correspondiente en formato _Biblatex_, a `references.bib`. Ejemplo:

    ```
     @book{Blackwell2022Live,
       title = {Live Coding: A User's Manual},
       shorttitle = {Live Coding Book},
       author = {Blackwell, Alan F. and Cocker, Emma and Cox, Geoff and McLean, Alex and Magnusson, Thor},
       date = {2022},
       series = {Software Studies},
       publisher = {{The MIT Press}},
       location = {{Cambridge, Massachusetts}},
       url = {https://livecodingbook.toplap.org/},
       abstract = {"A multi-authored comprehensive introduction to live coding's potential open up 
         deeper questions about contemporary cultural production and computational culture"--},
       isbn = {978-0-262-54481-8},
       pagetotal = {329},
       keywords = {Algorithms,Computer programming,Creation (Literary; artistic; etc.),Philosophy,
         Psychological aspects}
       }
     ```

2. Utilizar la llave de referencia contenida en la entrada. En el ejemplo es `Blackwell2022Live`.
3. Llamarla dentro del texto dependiendo del caso
   1. `@Blackwell2022Live` sale como `Blackwell et al. (2022)`.
   2. `[@Blackwell2022Live]` sale como `(Blackwell et al. 2022)`.
   3. `[@Blackwell2022Live; @Magnusson2018Performing]` sale como `(Blackwell et al.
2022; Magnusson and McLean 2018)`.

[^citas]: [Sintaxis de citas en el manual de pandoc](https://pandoc.org/MANUAL.html#citation-syntax).

### Matemáticas

También es posible incluir formulas matemáticas en linea, $\sqrt{3x-1}+(1+x)^2$, o en su propio párrafo 

$$\int_{a}^{b} x^2 \,dx$$

$$\left( \sum_{k=1}^n a_k b_k \right)^2 \leq \left( \sum_{k=1}^n a_k^2 \right) \left( \sum_{k=1}^n b_k^2 \right)$$
