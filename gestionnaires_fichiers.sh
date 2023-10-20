#!/bin/bash

 

# Fonction pour afficher le menu
afficher_menu() {
    clear
    echo "Gestionnaire de Fichiers en Ligne de Commande"
    echo "1. Créer un fichier"
    echo "2. Créer un répertoire"
    echo "3. Afficher le contenu d'un répertoire"
    echo "4. Déplacer un fichier ou un répertoire"
    echo "5. Copier un fichier ou un répertoire"
    echo "6. Renommer un fichier ou un répertoire"
    echo "7. Supprimer un fichier ou un répertoire"
    echo "8. Rechercher un fichier"
    echo "9. Compter les fichiers"
    echo "0. Quitter"
}

 

# Fonction pour créer un fichier
creer_fichier() {
    read -p "Nom du fichier à créer : " filename
    touch "$filename"
    echo "Fichier créé : $filename"
    sleep 2
}

 

# Fonction pour créer un répertoire
creer_repertoire() {
    read -p "Nom du répertoire à créer : " dirname
    mkdir "$dirname"
    echo "Répertoire créé : $dirname"
    sleep 2
}

 

# Fonction pour afficher le contenu d'un répertoire
afficher_contenu_repertoire() {
    read -p "Répertoire à afficher : " directory
    ls "$directory"
    read -p "Appuyez sur Entrée pour continuer..."
}

 

# Fonction pour déplacer un fichier ou un répertoire
deplacer_fichier() {
    read -p "Nom du fichier ou du répertoire à déplacer : " source
    read -p "Répertoire de destination : " destination
    mv "$source" "$destination"
    echo "$source déplacé vers $destination"
    sleep 2
}

 

# Fonction pour copier un fichier ou un répertoire
copier_fichier() {
    read -p "Nom du fichier ou du répertoire à copier : " source
    read -p "Répertoire de destination : " destination
    cp -r "$source" "$destination"
    echo "$source copié vers $destination"
    sleep 2
}

 

# Fonction pour renommer un fichier ou un répertoire
renommer_fichier() {
    read -p "Nom actuel du fichier ou du répertoire : " oldname
    read -p "Nouveau nom : " newname
    mv "$oldname" "$newname"
    echo "$oldname renommé en $newname"
    sleep 2
}

 
# Fonction pour supprimer un fichier ou un répertoire
supprimer_fichier() {
    read -p "Nom du fichier ou du répertoire à supprimer : " target
    # Vérifier si le fichier ou répertoire existe
    if [ -e "$target" ]; then
        # Demande de confirmation de l'utilisateur
        read -p "Confirmez la suppression de $target (O/n) : " confirm

        if [ "$confirm" = "O" ] || [ "$confirm" = "o" ]; then
            # Tentative de suppression
            rm -r "$target"
            # Vérifier si la suppression a réussi
            if [ $? -eq 0 ]; then
                echo "$target supprimé"
            else
                echo "La suppression de $target a échoué."
            fi
            sleep 2
        else
            echo "Suppression annulée."
            sleep 2
        fi
    else
        echo "$target n'existe pas."
        sleep 2
    fi
}

 

# Fonction pour rechercher un fichier
rechercher_fichier() {
    read -p "Nom du fichier à rechercher : " filename
    find . -type f -name "$filename"
    read -p "Appuyez sur Entrée pour continuer..."
}

 

# Fonction pour compter les fichiers
compter_fichiers() {
    count=$(find . -type f | wc -l)
    echo "Nombre total de fichiers dans ce répertoire : $count"
    read -p "Appuyez sur Entrée pour continuer..."
}

 

# Boucle principale
while true
do
    afficher_menu
    read -p "Choisissez une option : " choice

 

    case $choice in
        1)
            creer_fichier
            ;;
        2)
            creer_repertoire
            ;;
        3)
            afficher_contenu_repertoire
            ;;
        4)
            deplacer_fichier
            ;;
        5)
            copier_fichier
            ;;
        6)
            renommer_fichier
            ;;
        7)
            supprimer_fichier
            ;;
        8)
            rechercher_fichier
            ;;
        9)
            compter_fichiers
            ;;
        0)
            echo "Au revoir !"
            exit 0
            ;;
        *)
            echo "Option non valide. Appuyez sur Entrée pour continuer..."
            read
            ;;
    esac
done




