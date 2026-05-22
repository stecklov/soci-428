#!/bin/bash
set -e

# Configure RStudio preferences (Copilot, working directory, etc.)
mkdir -p /home/rstudio/.config/rstudio
cp /workspaces/soci-428/.devcontainer/rstudio-prefs.json /home/rstudio/.config/rstudio/rstudio-prefs.json
chown -R rstudio:rstudio /home/rstudio/.config/rstudio

# Symlink workspace into rstudio home for convenience
ln -sf /workspaces/soci-428 /home/rstudio/soci-428

# Install the quarto R package (for rendering from R)
Rscript -e "install.packages('quarto', repos='https://cloud.r-project.org')"

echo "Setup complete. RStudio available on port 8787."
echo "rstudio:rstudio" | chpasswd
echo "rstudio:rstudio" | chpasswd
