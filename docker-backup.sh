#!/bin/bash
# Usage: ./docker-backup.sh destination_path

if [ -z "$1" ]; then
        echo 'destination path not set!'
        exit 1
fi

destination_path=$1
echo "Backing up all docker volumes to $destination_path..."
 
# Get all docker volume mountpoints 
readarray -t volumes <<< "$(docker volume inspect -f '{{ .Mountpoint }}' $(docker volume ls -q))"

# Backup
for i in "${volumes[@]}"
do
        backupFolderName="$destination_path$i"
        echo "Backing up: $i to $backupFolderName"
        mkdir -p $backupFolderName
        cp -R $i $backupFolderName
done

echo "Fin!"
