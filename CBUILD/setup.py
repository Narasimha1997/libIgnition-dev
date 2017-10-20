from distutils.core import setup
from Cython.Build import cythonize
from distutils.core import Extension

ext = [
 Extension(name="Ignition", sources=['CBUILD/Ignition.pyx']),
 Extension(name='serialize', sources=['CBUILD/serialize.pyx'])
]
setup(ext_modules = cythonize(ext))
