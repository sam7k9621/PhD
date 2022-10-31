#!/bin/bash

rm -rf output
mkdir output

pdflatex -synctex=1 -interaction=nonstopmode PhD.tex > compile1.log 2>&1 

biber PhD

pdflatex -synctex=1 -interaction=nonstopmode PhD.tex > compile2.log 2>&1
pdflatex -synctex=1 -interaction=nonstopmode PhD.tex

FILELIST=($(ls -d PhD*))

for FILE in ${FILELIST[@]}
do
    if ! [ $FILE == *'.tex' ] && ! [ $FILE == *'.bib' ]; then
        mv $FILE output/.
    fi
done
