#!/bin/bash

while read p; do
  if [! -z "$p" ]; then
    R -e "install.packages('${p}', repos='http://cran.us.r-project.org', dependencies=TRUE)"
  fi
done < /R_packages.txt
