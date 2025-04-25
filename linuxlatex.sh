#!/bin/bash

# compile the LaTeX document
pdflatex -halt-on-error -interaction=nonstopmode $1 2>&1
filename=$(basename "$1" .tex)

# check the exit status of pdflatex
if [ $? -ne 0 ]; then
    echo "pdflatex encountered an error:"
    exit 1
fi

# check if the tex_info folder exists and create it if it doesn't
if [ ! -d "tex_info" ]; then
  mkdir tex_info
fi

# move the auxiliary files. ignore any warning if the files don't exist
mv "$filename.aux" tex_info/ 2>/dev/null
mv "$filename.fdb_latexmk" tex_info/ 2>/dev/null
mv "$filename.fls" tex_info/ 2>/dev/null
mv "$filename.log" tex_info/ 2>/dev/null
mv "$filename.synctex.gz" tex_info/ 2>/dev/null
mv "$filename.out" tex_info/ 2>/dev/null

exit 0