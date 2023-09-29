#!/bin/bash

utilisateur="user"
chemin_journal="/var/log/auth.log"

nombre_connexions=$(grep "$utilisateur" "$chemin_journal" | grep "session opened" | wc -l)
date_format=$(date +'%d-%m-%Y-%H:%M')
nom_fichier="$nombre_connexions-connexions-$date_format.txt"
echo "Nombre de connexions de $utilisateur : $nombre_connexions" > "$nom_fichier"
echo "$nom_fichier"

dossier_backup="Backup"
if [ ! -d "$dossier_backup" ]; then
    mkdir "$dossier_backup"
fi

nom_archive="$dossier_backup/$nom_fichier.tar.gz"

if [ -f "$nom_archive" ]; then
    rm "$nom_archive"
fi

tar -czvf "$nom_archive" "$nom_fichier"
rm "$nom_fichier"

