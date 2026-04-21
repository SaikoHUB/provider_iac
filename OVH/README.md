# INFRASTRUCTURE AS CODE SUR OVHCLOUD

Ce projet permet de déployer une machine virtuelle sur le Cloud Public d'OVH et d'y installer un serveur web de manière automatisée

---

## PREREQUIS

- Un compte OVHcloud avec un projet Public Cloud actif
- Des identifiants API générés sur api.ovh.com
- Une clé SSH publique ajoutée dans votre interface OVH

---

## STRUCTURE DU DOSSIER

- main.tf : Contient la logique de création de la ressource instance
- variables.tf : Permet de modifier la région ou la puissance sans toucher au code
- outputs.tf : Affiche l IP une fois la machine créée
- inventory.ini : Fichier de liaison pour Ansible
- playbook.yml : Recette pour l installation de Nginx



---

## DEPLOIEMENT

### Etape 1 : Terraform

Initialisez le dossier pour télécharger le provider OVH :
`terraform init`

Lancez la création de l infrastructure :
`terraform apply`

### Etape 2 : Ansible

Une fois l IP obtenue dans la console copiez la dans inventory.ini
Lancez ensuite la configuration :
`ansible-playbook -i inventory.ini playbook.yml`



---

## SECURITE

Pensez à protéger vos clés API dans le fichier main.tf ou utilisez des variables d environnement pour ne pas les laisser en clair dans votre code source

---

## NETTOYAGE

Pour supprimer l instance et arrêter la facturation :
`terraform destroy`