# PypTeX: the Python Preprocessor for TeX

### Author: Sébastien Loisel

PypTeX is the Python Preprocessor for LaTeX. It allows one to embed Python
code fragments in a LaTeX template file.

# Installation

`pip install pyptex`

You will also need a LaTeX installation, and the default LaTeX processor is `pdflatex`.

# Hello, world

Put the following in `example.tex`:

	\documentclass{article}
	@{from sympy import *}
	\begin{document}
	$$\int x^3\,dx = @{S('integrate(x^3,x)')}+C$$
	\end{document}

The command `pyptex example.tex` will generate `example.pdf` and an intermediary
pure-LaTeX file `example.pyptex`.

# Documentation

Detailed documentation can be found [here](https://htmlpreview.github.io/?https://github.com/sloisel/pyptex/blob/master/html/pyptex.html)
