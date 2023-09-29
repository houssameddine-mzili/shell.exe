#!/bin/bash

# Assurez-vous que le fichier CSV ne contient pas d'en-têtes
tail -n +2 Shell_Userlist.csv | while IFS=',' read -r id prenom nom mdp role
do
    # Créer un utilisateur avec les informations du CSV
    useradd -m -s /bin/bash -p "$mdp" "$nom"
    usermod -c "$prenom" "$nom"
    usermod -s /bin/bash "$nom"
    usermod -d "/home/$nom" "$nom"
    echo "Utilisateur $nom créé avec succès. Rôle : $role"

# Si le rôle est "Admin", ajouter l'utilisateur au groupe "sudo"
    if [ "$role" == "Admin" ]; then
    usermod -aG sudo "$nom"
    echo "User $nom added to the sudo group."
fi

done < Shell_Userlist.csv


