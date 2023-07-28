import os
import subprocess


def make_latex_from_py(filenames):
    for filename in filenames:
        document= '''\\documentclass{jsarticle}
\\usepackage{listings} 
\\lstset{
  language=Python,   
  basicstyle={\\ttfamily\\small},
  commentstyle={\\smallitshape},
  keywordstyle={\\small\\bfseries},
  ndkeywordstyle={\\small},
  stringstyle={\\small\\ttfamily},
  % frame={tb},
  breaklines=true,
  columns=[l]{fullflexible},
  numbers=left,
  numberstyle={\\scriptsize},
  stepnumber=1,
  numbersep=1zw,
  framesep=5pt,
}

\\begin{document}
\\begin{lstlisting}
'''
        with open(filename, 'r') as f:
            document += f.read()


        document += '''
\\end{lstlisting}
\\end{document}'''


        backslashIndex = filename.rfind('/')
        texfilename = filename[backslashIndex+1:][:-3]+'.tex'
        with open(f'tex/{texfilename}', 'w') as f:
            f.write(document)

    os.chdir('tex')
    subprocess.run(['latexmk', "*.tex"],shell=True)








def run_fast_scandir(dir, ext):  # dir: str, ext: list
  subfolders, files = [], []
  for f in os.scandir(dir):
    if f.is_dir():
      subfolders.append(f.path)
    if f.is_file():
      if os.path.splitext(f.name)[1].lower() in ext:
        files.append(f.path)
  for dir in list(subfolders):
    sf, f = run_fast_scandir(dir, ext)
    subfolders.extend(sf)
    files.extend(f)
  return subfolders, files

subfolders, files = run_fast_scandir('pylib', ['.py'])
filenames = []
for file in files:
    filenames.append(file)

# print(filenames)
make_latex_from_py(filenames)
