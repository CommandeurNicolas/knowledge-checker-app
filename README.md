# Install guide
Cloner le git.
## Application

* [VS Code flutter](https://www.youtube.com/watch?v=sfA3NWDBPZ4&list=PL4cUxeGkcC9j--TKIdkb3ISfRbJeJYQwC)   
* [Install Flutter](https://flutter.dev/docs/get-started/install)

## Firestore

* [Firebase](https://www.youtube.com/watch?v=Wa0rdbb53I8&list=PL4cUxeGkcC9j--TKIdkb3ISfRbJeJYQwC&index=2)

Sur l'adresse suivant, se connecter à son compte google : [Firebase](https://console.firebase.google.com/u/0/)

Creer un project, saisir le nom du projet.

Desactiver google analytics. Creer le projet.

### Ajouter une application android
* Android package name :  **com.knowledge_checker_app**
* App nickname : n'importe quoi
* Télécharger le fichier JSON et le placer dans le dossier android/app/

### Authentification 
* Cliquer sur l'onglet Authentification
* Cliquer sur commencer
* Ensuite sur Adresse e-mail/mdp
* Activer
* Enregistrer

### Firestore
* Cliquer sur l'onglet Cloud Firesotre
* Créer une base de données
* Démarrer en mode test
* Selectionner un serveur en Europe West 
  
### classes
***La typo est très importante*** :
* Créer une collection nommée **classes**
* Créer un document **M1 INFO** pour id
* avec comme champ :
  - title (String) = M1 INFO
  - number (number) = 0
  - waiting (array) = Tableau vide (petit supprimer à coté du champ pour remplir) 
* Au sein de cette collection, il faut créer une sous-collection **sections** avec pour id **sections**
* Il faut créer un document pour cette section
  - id = Java
  - title (String) = Java
  - description (String) = Apprendre Java pour les nuls
  - dans ce document, il faut créer une sous-collection **skills** avec pour id **skills**
    - il faut créer un document pour id **Objet** avec pour champ
      - title (string) = Objet
      - description (string) = Instancier un objet de type String

Le setup est fini.
# Fonctionnalité
* Inscription/Connexion : Teacher ou Student
* Listing des classes inscrites
* Déconnexion
* 

## Student
* Validation de skill d'une section avec preuve écrite
* Listing des sections de la classe dynamique

## Teacher
* Listing des étudiants inscrit dans une classe
* Ajout d'une section pour la classe
* Ajout de skill dans une section
* Validation de la requête de l'étudiant

# Architecture
Lors du premier lancement de l'application, l'utilisateur arrive sur la page de connexion, où il peut accéder à la page de l'inscription.
Une fois son compte créé, il peut accéder aux différentes fonctionnalités en fonction de son rôle.
# Technologies
Nous avons codé l'application en Flutter, qui est un framework en dart.
En base de donnée, nous avons utilisé Firebase, qui s'intègre facilement en Flutter. Base de donnée NoSql, qui s'impose pour une appli mobile étant donnée la quantité d'information à stocker et un nombre d'utilisateur important.
Un peu de mal avec Flutter que nous avons dû apprendre, ainsi que la connexion avec la base de donnée et les requêtes asynchrones à effectuer dessus.
Nous avions pensé à faire une API REST en Node/PHP/Laravel avec une base de donnée relationnel, mais nous avons rencontrée quelques difficultés sur la mise en place du serveur et des requêtes, nous nous sommes tournés vers Firebase.
# Améliorations 
