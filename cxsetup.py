import sys
import os
from cx_Freeze import setup, Executable


ext = '.exe' if os.name == 'nt' else ''
filename = 'theapp' + ext
bin_includes = []

if sys.platform == 'linux':
    bin_includes.extend(['libsqlite3.so.0', 'libstdc++.so.6', 'libz.so.1'])

setup(name='theapp',
      version='0.0.1',
      description='Test app',
      options={
          'build_exe': {
              'packages': ['site'],
              'excludes': ['tkinter'],
              'bin_includes': bin_includes,
              'include_msvcr': True,
              'include_files': []
          }
      },
      executables=[Executable('theapp.py', targetName=filename)]
      )
