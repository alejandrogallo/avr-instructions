
SOURCES = $(wildcard html/*html)
MANFILES = $(patsubst html/%.html,man3/%.3,$(SOURCES))
ASCIIDOCFILES = $(patsubst html/%.html,asciidoc/%.asciidoc,$(SOURCES))
markdownFILES = $(patsubst html/%.html,markdown/%.md,$(SOURCES))
vimdocfiles = $(patsubst html/%.html,vimdoc/%.txt,$(SOURCES))
ORGMODE_FILES = $(patsubst html/%.html,org/%.org,$(SOURCES))

all: \
	$(MANFILES) \
	$(ASCIIDOCFILES) \
	$(markdownFILES) \
	$(vimdocfiles) \
	$(ORGMODE_FILES) \


clean:
	rm -v $(MANFILES) $(ASCIIDOCFILES)

man3/%.3: html/%.html
	-@mkdir -p man3/
	pandoc -f html -t man $< > $@

org/%.org: html/%.html
	-@mkdir -p org/
	pandoc -f html -t org $< > $@

asciidoc/%.asciidoc: html/%.html
	-@mkdir -p $(dir $@)
	pandoc -f html -t asciidoc $< > $@

markdown/%.md: html/%.html
	-@mkdir -p $(dir $@)
	pandoc -f html -t markdown_github $< | \
	./tables-to-code.sed > $@

vimdoc/%.txt: markdown/%.md
	-@mkdir -p $(dir $@)
	./vim-tools/html2vimdoc.py $< > $@
