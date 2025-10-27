#!/bin/bash

rm ./caddy/Caddyfile
rm ./caddy/index.html
rm redir.*
## Generate redirection files
cat ./templates/header.txt ./config/*.conf | grep -v ^\# |grep -v "^[[:blank:]]*$" >redir.csv
csv2json --pretty redir.csv 
cat redir.json |tpl -f ./templates/caddyfile.tpl > caddy/Caddyfile
cat redir.json |tpl -f ./templates/index.tpl > caddy/index.html
rm redir.*

# Copy generated files to caddy directory
cp ./caddy/Caddyfile /etc/caddy/Caddyfile
cp ./caddy/index.html /srv/index.html
cp ./caddy/styles.css /srv/styles.css

# Run Caddy with the generated Caddyfile
caddy run --config /etc/caddy/Caddyfile 