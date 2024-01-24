# ------------------------------------------------------------------------------
# Variables del build
#
SOURCE=src/ejemplo.md

METADATA= metadata.yaml

BIBLIO=references.bib

OUTPUT=articulo

TARGET=$(OUTPUT)-xelatex.pdf $(OUTPUT)-pdflatex.pdf $(OUTPUT).html $(OUTPUT).docx

# Objetivos
## Por defecto `make` ejecuta `make all`
all: $(TARGET)

clean:
	rm $(OUTPUT)-xelatex.pdf $(OUTPUT)-pdflatex.pdf $(OUTPUT).html $(OUTPUT).docx

# Comandos
$(OUTPUT).html: $(SOURCE) $(BIBLIO)
	pandoc \
		--from=markdown+rebase_relative_paths \
		--template=pandoc/iclc.html \
		--citeproc --number-sections \
		--metadata-file $(METADATA) \
		--output $(OUTPUT).html \
		$(SOURCE)

$(OUTPUT)-pdflatex.pdf: $(SOURCE) $(BIBLIO) pandoc/iclc.latex pandoc/iclc.sty
	pandoc \
		--from=markdown+rebase_relative_paths \
		--template=pandoc/iclc.latex \
		--citeproc --number-sections \
		--pdf-engine=pdflatex \
		--metadata-file $(METADATA) \
		--output $(OUTPUT)-pdflatex.pdf \
		$(SOURCE)

$(OUTPUT)-xelatex.pdf: $(SOURCE) $(BIBLIO) pandoc/iclc.latex pandoc/iclc.sty
	pandoc \
		--from=markdown+rebase_relative_paths \
		--template=pandoc/iclc.latex \
		--citeproc --number-sections \
		--pdf-engine=xelatex \
		--metadata-file $(METADATA) \
		--output $(OUTPUT)-xelatex.pdf \
		$(SOURCE)

$(OUTPUT).docx: $(SOURCE) $(BIBLIO)
	pandoc \
		--from=markdown+rebase_relative_paths \
		--citeproc --number-sections \
		--metadata-file $(METADATA) \
		--output $(OUTPUT).docx \
		$(SOURCE)
