from setuptools import setup, find_packages
from distutils.command.build_scripts import build_scripts
from pathlib import Path
import sys,os
from contextlib import suppress


this_directory = Path(__file__).parent.absolute()
long_description = Path(this_directory, 'README.md').read_text(encoding='utf-8')

def ensureFile(scriptname,thescript):
    writeScript = True
    with suppress(Exception):
        with open(scriptname,"rt") as file:
            if(file.read()==thescript):
                writeScript = False
    if(writeScript):
        with open(scriptname,"wt") as file:
            file.write(thescript)

ensureFile("scripts/pyptex",r"""#!/bin/sh
{} -u -m pyptex $@
""".format(sys.executable)
)
os.system("chmod a+rx scripts/pyptex")


setup(
    name='pyptex',
    description='Python Preprocessor for (La)TeX',
    version='1.1.2',
    packages=find_packages(),
    install_requires=['sympy>=1.5', 'numpy>=1.18', 'setuptools', 'pdoc3>=0.7','matplotlib'],
    python_requires='>=3',
    author='Sébastien Loisel',
    author_email='sloisel@gmail.com',
    zip_safe=False,
    url='https://github.com/sloisel/pyptex',
    project_urls={
        'Documentation': 'https://htmlpreview.github.io/?https://github.com/sloisel/pyptex/blob/master/pyptex.html',
        'Source': 'https://github.com/sloisel/pyptex',
    },
    license='MIT',
    scripts=['scripts/pyptex'],
    long_description=long_description,
    long_description_content_type='text/markdown',
)
