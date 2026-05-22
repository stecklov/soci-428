#!/bin/bash
set -e

# Install R packages needed for the course
Rscript -e "install.packages(c('tidyverse', 'quarto'), repos='https://cloud.r-project.org')"

# Install nginx (used to proxy RStudio and fix redirect URLs behind GitHub's proxy)
sudo apt-get update -qq
sudo apt-get install -y nginx

# Configure nginx: expose port 8080 → proxy to RStudio on 8787
# proxy_redirect rewrites Location headers from localhost:8787 to relative paths
# so the browser stays on the app.github.dev domain instead of following to localhost
sudo tee /etc/nginx/sites-available/rstudio > /dev/null << 'EOF'
server {
    listen 8080;
    location / {
        proxy_pass         http://127.0.0.1:8787;
        proxy_http_version 1.1;
        proxy_set_header   Upgrade $http_upgrade;
        proxy_set_header   Connection "upgrade";
        proxy_set_header   Host $host;
        proxy_read_timeout 20d;
        proxy_redirect     http://localhost:8787/ /;
    }
}
EOF

sudo ln -sf /etc/nginx/sites-available/rstudio /etc/nginx/sites-enabled/rstudio
sudo rm -f /etc/nginx/sites-enabled/default

echo "Setup complete. RStudio will be available on port 8080 via nginx."
