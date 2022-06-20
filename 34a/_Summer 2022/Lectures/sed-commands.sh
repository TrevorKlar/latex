#!/usr/bin/env bash

cd /Users/trevor/git/latex/34a/_Summer\ 2022

for f in Lectures/**/*.tex

do
sed -i 's/Peter M.\\ Garfield/Trevor Klar/g' "$f"
sed -i 's/garfield@math.ucsb.edu/trevorklar@math.ucsb.edu/g' "$f"
sed -i 's/South Hall 6510/South Hall 6431X (Grad Tower, 6th floor, blue side, first door on the right)/g' "$f"
sed -i 's/(Office Hours:}\\\\\n.*?})(.*\n.*\n.*\n.*\n)/$1 MTWR after class 2:00-3:00, and by appointment (Really! Just send me an email and I’m happy to make an appointment). I’m also available for appointments by Zoom./' "$f"

done
