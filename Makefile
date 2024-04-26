# ------------------------------------------------------------------------------
# Variables del build
#
SOURCE=src/manual_de_autores.md

METADATA= metadata.yaml

BIBLIO=references.bib

OUTPUT=manual_de_autores

TARGET=$(OUTPUT).pdf $(OUTPUT)-iclc.pdf $(OUTPUT).html $(OUTPUT).docx


# Objetivos
## Por defecto `make` ejecuta `make all`
all: $(TARGET)

pdf: $(OUTPUT).pdf

doc: $(OUTPUT).docx

html: $(OUTPUT).html

clean:
	rm -f $(OUTPUT).pdf $(OUTPUT)-iclc.pdf $(OUTPUT).html $(OUTPUT).docx

# Comandos
$(OUTPUT).html: $(SOURCE) $(BIBLIO) pandoc/iclc.html
	pandoc \
		--from=markdown+rebase_relative_paths \
		--template=pandoc/iclc.html \
		--citeproc --number-sections \
		--fail-if-warnings \
		--metadata-file $(METADATA) \
		--output $(OUTPUT).html \
		$(SOURCE)

$(OUTPUT).pdf: $(SOURCE) $(BIBLIO) pandoc/heptagrama.latex
	pandoc \
		--from=markdown+rebase_relative_paths \
		--template=pandoc/heptagrama.latex \
		--citeproc --number-sections \
		--fail-if-warnings \
		--pdf-engine=xelatex \
		--metadata-file $(METADATA) \
		--output $(OUTPUT).pdf \
		--lua-filter=pandoc/lua-filters/abc-to-sheet.lua \
		$(SOURCE)

# Con plantilla del ICLC para comparación
# Requiere Pandoc v.3.1.5
$(OUTPUT)-iclc.pdf: $(SOURCE) $(BIBLIO) pandoc/iclc.latex pandoc/iclc.sty
	pandoc \
		--from=markdown+rebase_relative_paths \
		--template=pandoc/iclc.latex \
		--citeproc --number-sections \
		--fail-if-warnings \
		--pdf-engine=xelatex \
		--metadata-file $(METADATA) \
		--lua-filter=pandoc/lua-filters/abc-to-sheet.lua \
		--output $(OUTPUT)-iclc.pdf \
		$(SOURCE)

$(OUTPUT).docx: $(SOURCE) $(BIBLIO)
	pandoc \
		--from=markdown+rebase_relative_paths \
		--citeproc --number-sections \
		--fail-if-warnings \
		--metadata-file $(METADATA) \
		--output $(OUTPUT).docx \
		$(SOURCE)
