#!/usr/bin/env bash

echo "Adding changes to staging, committing, and pushing to remote repo"
git add . &&
git commit -m "Revision: $(date +%s)" &&
git push;


echo "...Building docker image..."
docker build -t web-term .
docker images
echo "...Running docker container based on image..."
docker run -p 8080:80 web-term  
docker ps