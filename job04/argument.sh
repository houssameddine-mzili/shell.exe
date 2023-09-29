#!/bin/bash

# Vérifie si le nombre d'arguments est correct
if [ "$#" -ne 2 ]; then
  echo "Usage: $0 <nouveau_fichier> <fichier_source>"
  exit 1
fi

nouveau_fichier="$1"
fichier_source="$2"

# Vérifie si le fichier source existe
if [ ! -e "$fichier_source" ]; then
  echo "Le fichier source '$fichier_source' n'existe pas."
  exit 1
fi

# Copie le contenu du fichier source vers le nouveau fichier en utilisant la redirection
cat "$fichier_source" > "$nouveau_fichier"

# Vérifie si la copie a réussi
if [ $? -eq 0 ]; then
  echo "Le contenu de '$fichier_source' a été copié dans '$nouveau_fichier'."
else
  echo "Une erreur s'est produite lors de la copie."
fi
