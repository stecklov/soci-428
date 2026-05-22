#!/bin/bash
set -e

# Install R packages needed for the course
Rscript -e "install.packages(c('tidyverse', 'quarto'), repos='https://cloud.r-project.org')"

echo "Setup complete. RStudio will be available on port 8787."
