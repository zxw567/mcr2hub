#!/bin/bash

file="mcr_images.properties"

if [ -f "$file" ]
then
  echo "$file found."

  while IFS='=' read -r key value
  do
    #echo "${key}=${value}"
    docker pull ${value}
    docker tag ${value} ${key}
    docker push ${key}
    docker rmi ${value}
    docker rmi ${key}
  done < "$file"

else
  echo "$file not found."
fi

