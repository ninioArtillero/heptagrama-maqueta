# ------------------------------------------------------------------------------
# Variables del build
#
SOURCE=src/manual_de_autores.md

METADATA= metadata.yaml

BIBLIO=references.bib

OUTPUT=manual_de_autores

TARGET=$(OUTPUT).pdf $(OUTPUT).html $(OUTPUT).docx


# Objetivos
## Por defecto `make` ejecuta `make all`
all: $(TARGET)

pdf: $(OUTPUT).pdf

doc: $(OUTPUT).docx

html: $(OUTPUT).html

clean:
	rm -f $(OUTPUT).pdf $(OUTPUT).html $(OUTPUT).docx

# Comandos
$(OUTPUT).html: $(SOURCE) $(BIBLIO)
	pandoc \
		--from=markdown+rebase_relative_paths \
		--template=pandoc/iclc.html \
		--citeproc --number-sections \
		--metadata-file $(METADATA) \
		--output $(OUTPUT).html \
		$(SOURCE)

$(OUTPUT).pdf: $(SOURCE) $(BIBLIO) pandoc/iclc.latex pandoc/iclc.sty
	pandoc \
		--from=markdown+rebase_relative_paths \
		--template=pandoc/iclc.latex \
		--citeproc --number-sections \
		--pdf-engine=xelatex \
		--metadata-file $(METADATA) \
		--output $(OUTPUT).pdf \
		$(SOURCE)

$(OUTPUT).docx: $(SOURCE) $(BIBLIO)
	pandoc \
		--from=markdown+rebase_relative_paths \
		--citeproc --number-sections \
		--metadata-file $(METADATA) \
		--output $(OUTPUT).docx \
		$(SOURCE)
