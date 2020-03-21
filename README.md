# PypTeX: the Python Preprocessor for TeX

### Author: Sébastien Loisel

PypTeX is the Python Preprocessor for LaTeX. It allows one to embed Python
code fragments in a LaTeX template file.

<img alt="An example plot with PypTeX" width="500" src="https://raw.githubusercontent.com/sloisel/pyptex/master/examples/brochure.png">

# Installation

`pip install pyptex`

1. You will also need a LaTeX installation, and the default LaTeX processor is `pdflatex`.
2. You need a Python 3 installation.

# Hello, world

Put the following in `example.tex`:

	\documentclass{article}
	@{from sympy import *}
	\begin{document}
	$$\int x^3\,dx = @{S('integrate(x^3,x)')}+C$$
	\end{document}

The command `pyptex example.tex` will generate `example.pdf` and an intermediary
pure-LaTeX file `example.pyptex`. The resulting PDF can be found
[here](https://github.com/sloisel/pyptex/blob/master/examples/example.pdf)

* The `pyptex` executable tries to locate the Python 3 executable using `/usr/bin/env python3`. If this is causing you problems, try `python -u -m pyptex example.tex` instead.

# Slightly bigger examples

* 2d and 3d plotting [tex](https://github.com/sloisel/pyptex/blob/master/examples/plots.tex)
| 
[pdf](https://github.com/sloisel/pyptex/blob/master/examples/plots.pdf)
* Matrix inverse exercise [tex](https://github.com/sloisel/pyptex/blob/master/examples/matrixinverse.tex)
|
[pdf](https://github.com/sloisel/pyptex/blob/master/examples/matrixinverse.pdf)
* The F19NB handout for numerical linear algebra at Heriot-Watt university is generated with PypTeX. [pdf](https://www.macs.hw.ac.uk/~sl398/notes.pdf)

# TeXShop

If you want to use TeXShop on Mac, put the following into `~/Library/TeXShop/Engines/pyptex.engine` and restart TeXShop:
```
#!/bin/bash
pyptex $1
```

# Documentation

Detailed documentation can be found [here](https://htmlpreview.github.io/?https://github.com/sloisel/pyptex/blob/master/html/pyptex.html)
