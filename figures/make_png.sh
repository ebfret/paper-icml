#!/bin/bash
export PATH="/Applications/Inkscape.app/Contents/Resources/bin/:$PATH"
for file in *.svg
do
  png_file=${file/.svg/_${1}dpi.png}
  if [[ ( ! -e "$png_file" ) || ( "$file" -nt "$png_file" ) ]]
  then
      inkscape \
      -f "$file" \
      -d $1 -C \
      -e "$png_file"
  fi 
done
