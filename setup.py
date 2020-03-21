from setuptools import setup, find_packages
from distutils.command.build_scripts import build_scripts
from pathlib import Path


this_directory = Path(__file__).parent.absolute()
long_description = Path(this_directory, 'README.md').read_text(encoding='utf-8')


# don't touch my shebang
class BSCommand(build_scripts):
    def run(self):
        """Copy, chmod each script listed in 'self.scripts'
        essentially this is the stripped
        distutils.command.build_scripts.copy_scripts()
        routine
        """
        from stat import ST_MODE
        from distutils.dep_util import newer
        from distutils import log
        import os

        self.mkpath(self.build_dir)
        outfiles = []
        for script in self.scripts:
            outfile = Path(self.build_dir, Path(script).stem)
            outfiles.append(outfile)

            if not self.force and not newer(script, outfile):
                log.debug('not copying {script} (up-to-date)')
                continue

            log.info('copying and NOT adjusting {script} -> {self.build_dir}')
            self.copy_file(script, outfile)

        if os.name == 'posix':
            for file in outfiles:
                if self.dry_run:
                    log.info(f'changing mode of {file}')
                else:
                    oldmode = os.stat(file)[ST_MODE] & 0o7777
                    newmode = (oldmode | 0o555) & 0o7777
                    if newmode != oldmode:
                        log.info(f'changing mode of {file} from {oldmode} to {newmode}')
                        os.chmod(file, newmode)


setup(
    name='pyptex',
    description='Python Preprocessor for (La)TeX',
    version='0.2.1',
    packages=find_packages(),
    install_requires=['sympy>=1.5', 'numpy>=1.18', 'setuptools', 'pdoc3>=0.7'],
    python_requires='>=3',
    author='Sébastien Loisel',
    author_email='sloisel@gmail.com',
    zip_safe=False,
    url='https://github.com/sloisel/pyptex',
    project_urls={
        'Documentation': 'https://htmlpreview.github.io/?https://github.com/sloisel/pyptex/blob/master/html/pyptex.html',
        'Source': 'https://github.com/sloisel/pyptex',
    },
    license='MIT',
    scripts=['scripts/pyptex'],
    cmdclass={'build_scripts': BSCommand},
    long_description=long_description,
    long_description_content_type='text/markdown',
)
