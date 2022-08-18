import os
from pathlib import Path

for i in range(10):
    dir_name = f'temp{i}'
    os.rmdir(dir_name)
    os.mkdir(dir_name)
    os.chdir(dir_name)
    Path(f'file{i}').touch()
    os.chdir('../')
