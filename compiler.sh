#!/bin/bash

rm -rf output
mkdir output

pdflatex -synctex=1 -interaction=nonstopmode PhDThesis.tex > compile1.log 2>&1 

biber PhDThesis

pdflatex -synctex=1 -interaction=nonstopmode PhDThesis.tex > compile2.log 2>&1
pdflatex -synctex=1 -interaction=nonstopmode PhDThesis.tex

FILELIST=($(ls -d PhDThesis*))

for FILE in ${FILELIST[@]}
do
    if ! [ $FILE == *'.tex' ] && ! [ $FILE == *'.bib' ]; then
        mv $FILE output/.
    fi
done
