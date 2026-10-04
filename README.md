# EU PVSEC LaTeX Template

LaTeX class matching the Word template for EU PVSEC papers (<https://www.eupvsec.org/index.php/instructions-notes-for-authors>). The conference provides only a Word template. This class is not official.

Files: `eupvsec.cls` (layout), `example.tex` (example paper), `refs.bib` (sample bibliography).

## Usage

1. Copy `example.tex` and edit the title block (`\title`, `\paperauthors`, `\paperaffiliation`, `\paperaddress`, `\paperabstract`, `\paperkeywords`).
2. Replace the body text with your paper and add references to `refs.bib`.
3. Compile:

```
pdflatex example
bibtex example
pdflatex example
pdflatex example
```

or with [latexwrapper](https://github.com/Naheel-Azawy/latexwrapper):

```
latexwrapper example.tex
```

## Credits

Naheel Azawy, 2026. Layout from the EU PVSEC Word template.
