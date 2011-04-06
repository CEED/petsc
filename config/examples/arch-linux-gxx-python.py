#!/usr/bin/python
if __name__ == '__main__':
  import sys
  import os
  sys.path.insert(0, os.path.abspath('config'))
  import configure
  configure_options = [
    '--download-f-blas-lapack=1',
    '--download-mpich=1',
    '--with-cc=g++',
    '--with-clanguage=c++',
    '--with-scalar-type=complex',
    '--with-dynamic-loading=1',
    '--with-shared-libraries=1',
    '--with-python=1',
    '--PETSC_ARCH=arch-linux-gxx-python'
    ]
  configure.petsc_configure(configure_options)
