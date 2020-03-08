all: test doc hooks dist examples

.PHONY: all clean test doc hooks delete-hooks reinstall-hooks dist examples pypi

html/pyptex.html: pyptex/__init__.py
	pdoc --html .
	cp -f html/pyptex/index.html html/pyptex.html
	rm -rf html/pyptex
	git add html/pyptex.html

clean:
	rm -rf html pyptex.egg-info tests/runtests.log dist build examples/*.pdf examples/*.pyptex examples/*.pickle

test:
	cd tests && ./runtests

doc: html/pyptex.html

exsrc := $(wildcard examples/*.tex)
exdst := $(patsubst examples/%.tex,examples/%.pyptex,$(exsrc))
export PYTHONPATH := $(shell pwd)
examples/%.pyptex: examples/%.tex pyptex/__init__.py
	export OPATH=$(PATH); PATH=$(PYTHONPATH)/scripts:$(PATH); cd examples; rm -f *.aux *.log *.pyplog *.pyptex *.synctex.gz; ../scripts/pyptex `echo $< | sed 's/examples\///'`
examples: ${exdst}

hooksrc := $(wildcard hooks/*)
hookdst := $(patsubst hooks/%,.git/hooks/%,$(hooksrc))

.git/hooks/%: hooks/%
	@(echo "Installing hooks")
	@if [ -f $@ ]; then echo "Fatal Error: hook $@ already exists.\nTo recover 'make reinstall-hooks' will\ndelete and reinstall all the following hooks:\n" ${hookdst}; false; fi
	cp $< $@

hooks: ${hookdst}

delete-hooks:
	rm ${hookdst}

reinstall-hooks: delete-hooks hooks

dist/.mark: setup.py pyptex/__init__.py
	rm -rf dist
	python3 setup.py sdist
	touch dist/.mark

dist: dist/.mark

pypi: all
	twine upload dist/*
