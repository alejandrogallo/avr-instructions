
SOURCES = $(wildcard html/*html)
MANFILES = $(patsubst html/%.html,man3/%.3,$(SOURCES))
ASCIIDOCFILES = $(patsubst html/%.html,asciidoc/%.asciidoc,$(SOURCES))
markdownFILES = $(patsubst html/%.html,markdown/%.md,$(SOURCES))
vimdocfiles = $(patsubst html/%.html,vimdoc/%.txt,$(SOURCES))

all: \
	$(MANFILES) \
	$(ASCIIDOCFILES) \
	$(markdownFILES) \
	$(vimdocfiles) \


clean:
	rm -v $(MANFILES) $(ASCIIDOCFILES)

man3/%.3: html/%.html
	-@mkdir -p man3/
	pandoc -f html -t man -Ss $< > $@

asciidoc/%.asciidoc: html/%.html
	-@mkdir -p $(dir $@)
	pandoc -f html -t asciidoc -Ss $< > $@

markdown/%.md: html/%.html
	-@mkdir -p $(dir $@)
	pandoc -f html -t markdown_github -Ss $< | \
	./tables-to-code.sed > $@

vimdoc/%.txt: markdown/%.md
	-@mkdir -p $(dir $@)
	./vim-tools/html2vimdoc.py $< > $@
