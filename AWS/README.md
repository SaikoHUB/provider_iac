# TP INFRASTRUCTURE AS CODE AWS

---

## PRESENTATION DU PROJET
Ce dépôt contient l automatisation pour déployer une instance EC2 et installer un serveur Nginx via Terraform et Ansible

---

## STRUCTURE DES FICHIERS
- main.tf : Déploiement VPC sous réseau sécurité et instance
- variables.tf : Définition de la région et du type d instance
- outputs.tf : Extraction automatique de l adresse IP publique
- inventory.ini : Configuration de l accès pour Ansible
- playbook.yml : Script d installation automatisée de Nginx

---

## CONFIGURATION INITIALE
Avant de commencer vérifiez les points suivants

### Accès AWS
Configurez vos identifiants via la console AWS CLI ou exportez vos clés d accès dans le terminal

### Clé SSH
Placez votre fichier .pem dans le dossier
Appliquez les droits restrictifs sur Linux ou Mac :
`chmod 400 votre_cle.pem`

### Mise à jour du code
- Dans main.tf : ajoutez l argument key_name dans la ressource aws_instance pour l associer à votre paire de clés
- Dans inventory.ini : remplacez le chemin ansible_ssh_private_key_file par le nom réel de votre fichier .pem

---

## GUIDE D UTILISATION

### Etape 1 : Terraform
Initialisez le répertoire :
`terraform init`

Vérifiez la syntaxe :
`terraform validate`

Déployez l infrastructure :
`terraform apply`
(Tapez yes pour confirmer la création)

### Etape 2 : Ansible
Récupérez l adresse IP affichée dans le terminal après le apply
Collez cette IP dans inventory.ini à la place de la mention remplacer_par_ip_publique

Lancez la configuration logicielle :
`ansible-playbook -i inventory.ini playbook.yml`

---

## DETAILS DU FICHIER INVENTORY.INI
Ce fichier fait le lien entre vos scripts et la machine réelle

> [web] : Nom du groupe d hôtes utilisé dans le playbook
> IP : Adresse de destination pour les commandes
> ansible_user : Utilisateur par défaut pour Ubuntu sur AWS
> ansible_ssh_private_key_file : Emplacement de la clé de sécurité pour ouvrir la connexion

---

## VALIDATION FINALE
Ouvrez un navigateur et saisissez l adresse IP publique de l instance
Si la page Welcome to nginx s affiche votre TP est réussi

---

## NETTOYAGE
Pour supprimer toutes les ressources et éviter les frais inutiles :
`terraform destroy`