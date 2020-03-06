all: test doc hooks distro

.PHONY: all clean test doc hooks delete-hooks reinstall-hooks distro

html/pyptex.html: pyptex/__init__.py
	pdoc --html .
	cp -f html/pyptex/index.html html/pyptex.html
	rm -rf html/pyptex
	git add html/pyptex.html

clean:
	rm -rf html pyptex.egg-info tests/runtests.log dist build

test:
	cd tests && ./runtests

doc: html/pyptex.html

hooksrc = $(wildcard hooks/*)
hookdst = $(patsubst hooks/%,.git/hooks/%,$(hooksrc))

.git/hooks/%: hooks/%
	@(echo "Installing hooks")
	@if [ -f $@ ]; then echo "Fatal Error: hook $@ already exists.\nTo recover 'make reinstall-hooks' will\ndelete and reinstall all the following hooks:\n" ${hookdst}; false; fi
	cp $< $@

hooks: ${hookdst}

delete-hooks:
	rm ${hookdst}

reinstall-hooks: delete-hooks hooks

dist/mark.txt: setup.py pyptex/__init__.py
	rm -rf dist
	python3 setup.py sdist
	touch dist/mark.txt

distro: dist/mark.txt
