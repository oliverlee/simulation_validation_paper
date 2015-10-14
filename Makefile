PROJECT=introduction
BUILD_DIR=build

.PHONY: directories

all: directories ${PROJECT}.pdf

directories: ${BUILD_DIR}

# -pdf                      generate PDF directly (instead of DVI)
# -pdflatex=""              call specific backend with specific options
# -jobname=                 change the output file name
# -bibtex                   generate necessary bibtex files
# -use-make                 use 'make' to generate missing files

# -interaction=nonstopmode keeps the pdflatex backend from stopping at a
# missing file reference and interactively asking you for an alternative.

${PROJECT}.pdf: ${PROJECT}.tex
	latexmk -pdf -pdflatex="pdflatex -interaction=nonstopmode" -jobname=${BUILD_DIR}/${PROJECT} -bibtex -use-make ${PROJECT}.tex

clean:
	latexmk -c -jobname=${BUILD_DIR}/${PROJECT} -bibtex ${PROJECT}.tex

${BUILD_DIR}:
	mkdir ${BUILD_DIR}
