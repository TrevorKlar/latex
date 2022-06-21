#!/usr/bin/env bash

cd /Users/trevor/git/latex/34a/_Summer\ 2022

for f in Lectures/**/*.tex; do cd $(dirname "$f") && /Library/TeX/texbin/pdflatex -interaction=nonstopmode $(basename "$f") && /Library/TeX/texbin/pdflatex -interaction=nonstopmode $(basename "$f") && cd ../; done
