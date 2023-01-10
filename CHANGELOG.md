
# v1.4.5

* Update version number (commit 29d1e3a by Sébastien Loisel)
* In pyp.print, allow @@ to make @ (commit 0e3e07e by Sébastien Loisel)

# v1.4.4

* bugfixes for make-pypi-release script (commit 845c70c by Sébastien Loisel)
* Some bugfixes in make-pypi-release script (commit 14e2ac4 by Sébastien Loisel)
* Documentation fixes relating to pyp.pp(...) and added CHANGELOG.md (commit 02d94bb by Sébastien Loisel)

# v1.4.3

* Apparently, savefig(...) is buggy and canvas.print_figure(...) is better. (commit e531cdd by Sébastien Loisel)

# v1.4.2

* Bugfix -- somehow the I forgot to savefig the figures. (commit ad3dc9c by Sébastien Loisel)

# v1.4.1

* Bugfix. You can set fig.drawn = True to prevent it from getting auto-drawn at the end of the Python block. (commit 87d250c by Sébastien Loisel)
* Changes this patch were complicated but user-facing things, not so much. The major changes all have to do with matplotlib.  (commit d31e0a9 by Sébastien Loisel)
* Impossible to unit test plotting, reverting the change. (commit 9f40cc6 by Sébastien Loisel)
* Having trouble getting the plots to be pixel-perfect reproducible. Added fuzz factor to comparison. (commit 6677603 by Sébastien Loisel)
* removing .fdb_latexmk files from repo (commit d79edde by Sébastien Loisel)
* removing an fls file from the repo (commit 17e056d by Sébastien Loisel)
* ignore fls files (commit 71ca1bb by Sébastien Loisel)
* Added unit test for plotting, sympy, and pyp.input (commit 634cbfc by Sébastien Loisel)

# v1.4.0

* pyptex.input now returns a namespace. also, fixed some image comparison problems in unit tests. (commit 63de3cf by Sébastien Loisel)

# v1.3.3

* bump version number (commit a93f738 by Sébastien Loisel)
* update to streamcapture 1.1 (commit 2cddc79 by Sébastien Loisel)
* .gitattributes file (commit e888c01 by Sebastien Loisel)

# v1.3.2

* doc tweak (commit 2ea11f5 by Sebastien Loisel)

# v1.3.1

* documentation tweaks (commit 6d72f82 by Sebastien Loisel)

# v1.3.0

* new pyptex backend for matplotlib (commit 1d39f47 by Sebastien Loisel)

# v1.2.0

* Bumped version number (commit 8237791 by Sebastien Loisel)
* using StreamCapture library to create log file, instead of shell command tee (commit 53b7f5d by Sebastien Loisel)

# v1.1.3

* Quick Windows support modification (commit 11ae6a1 by Sebastien Loisel)

# v1.1.2

* documentation tweaks (commit 089850c by Sebastien Loisel)

# v1.1.1

* documentation tweaks (commit c790b78 by Sebastien Loisel)
* documentation fixes (commit 5fbd704 by Sebastien Loisel)

# v1.1.0

* Added pyp.clear and pyp.freeze. Also, recent sympy broke latex printing in some cases, fixed it. (commit 167d145 by Sebastien Loisel)
* Create CODE_OF_CONDUCT.md  (commit 9a02827 by Sébastien Loisel)
* Create pull_request_template.md  (commit 5905350 by Sébastien Loisel)
* Update issue templates  (commit 14d75cc by Sébastien Loisel)
* Create contributing.md  (commit 0829eff by Sébastien Loisel)

# v1.0.1

* documentation tweak and make tweak. (commit c911ab0 by Sébastien Loisel)
* tweaked building of scripts/pyptex to avoid inadvertantly causing a rebuild when using make (commit 10827b8 by Sébastien Loisel)

# v1.0.0

* Work around pip shebang bugs in a less brittle way by generating the pyptex script from setup.py. (commit 7daa386 by Sébastien Loisel)

# v0.2.1

* bump revision number (commit b5c9bdf by Sébastien Loisel)
* Fix the image link (commit 87d5bf3 by Sébastien Loisel)

# v0.2.0

* Added pyp.cite() command (commit 915fbde by Sébastien Loisel)
* new command pyp.cite (commit 1483e95 by Sébastien Loisel)
* There was a very minor error with argv in HLiam, but this revealed a much bigger mistake on my part.  (commit 3882fac by Sébastien Loisel)

# v0.1.4

* style changes (pep8) & minor refactoring  (commit 5fc51a4 by Liam Henrickson)
* OK so the bit of documentation in the previous patch was actually broken, and the bit that prevents the example.pdf files from repeatedly being recommitted also was broken. I think they are both fixed now, fingers crossed.  (commit bcc7e2e by Sébastien Loisel)
* This started out as a super minor tweak to the documentation but snowballed into a monumental investigation into the lugubrious depths of pdf files.  (commit 3f6e34e by Sébastien Loisel)
* slight documentation tweak mk 2  (commit 21cc504 by Sébastien Loisel)
* slight documentation tweak  (commit 7b924f0 by Sébastien Loisel)
* tweak brochure image mark 3  (commit e6e8b33 by Sébastien Loisel)
* tweak brochure image mark 2  (commit 01b3abd by Sébastien Loisel)
* tweak brochure image  (commit 0b6d3e3 by Sébastien Loisel)
* added a 'brochure' image  (commit 1f1a649 by Sébastien Loisel)
* TeXShop tip in readme  (commit 09e4b30 by Sébastien Loisel)
* tweak readme  (commit 761888e by Sébastien Loisel)
* bugfixes in Makefile related to examples, and made it possible to do python -m pyptex  (commit ab09fc2 by Sébastien Loisel)
* also link to F19NB handout  (commit fc4b18a by Sébastien Loisel)
* plotting example  (commit 194b85b by Sébastien Loisel)
* another example  (commit c3f92cd by Sébastien Loisel)
* fixed some links  (commit 32a5a40 by Sébastien Loisel)
* added pyptex.pp and a matrix inversion example  (commit 1432676 by Sébastien Loisel)
* tweaked setup.py for long description on pypi  (commit 7a5d203 by Sébastien Loisel)
* added some build targets, tweaked setup.py for pypi, fixed path issued in runtest, updated gitignore  (commit ba64d03 by Sébastien Loisel)
* fix documentation link  (commit d02731e by Sébastien Loisel)
* initial commit  (commit 02ba1a0 by Sébastien Loisel)
