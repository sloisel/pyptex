all: test doc hooks dist examples

.PHONY: all clean test doc hooks delete-hooks reinstall-hooks dist examples pypi CHANGELOG.md

pyptex.html: pyptex/__init__.py
	pdoc --html .
	cp -f html/pyptex/index.html pyptex.html
	rm -rf html
	git add pyptex.html

clean:
	rm -rf html pyptex.egg-info tests/runtests.log dist build examples/*.pdf examples/*.pyptex examples/*.pickle scripts/pyptex

tests/runtests.success.log: Makefile pyptex/*.py scripts/pyptex tests/runtest tests/runtests tests/test?/test?.tex
	cd tests && ./runtests

scripts/pyptex: setup.py Makefile
	python3 setup.py --help > /dev/null
	touch scripts/pyptex

test: tests/runtests.success.log

doc: pyptex.html

exsrc := $(wildcard examples/*.tex)
exdst := $(patsubst examples/%.tex,examples/%.pdf,$(exsrc))
export PYTHONPATH := $(shell pwd)
examples/%.pdf: examples/%.tex pyptex/*.py scripts/pyptex scripts/pdflatex Makefile
	export OPATH=$(PATH); PATH=$(PYTHONPATH)/scripts:$(PATH); cd examples; rm -f *.aux *.log *.pyplog *.pyptex *.synctex.gz; ../scripts/pyptex `echo $< | sed 's/examples\///'`
examples: ${exdst}

hooksrc := $(wildcard hooks/*)
hookdst := $(patsubst hooks/%,.git/hooks/%,$(hooksrc))

.git/hooks/%: hooks/%
	@(echo "Installing hooks")
	@if [ -f $@ ]; then echo "Fatal Error: hook $@ already exists.\nTo recover 'make reinstall-hooks' will\ndelete and reinstall all the following hooks:\n" ${hookdst}; false; fi
	cp $< $@

CHANGELOG.md:
	scripts/makechangelog >CHANGELOG.md

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
	scripts/make-pypi-release && twine upload dist/*
