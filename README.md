# Docker MySQL Lab

Ce projet configure un environnement MySQL dans Docker pour le développement et les tests.

## Prérequis

- Docker
- Docker Compose (optionnel)

## Configuration

1. Copiez le fichier `.env.example` vers `.env` et ajustez les variables selon vos besoins :
   ```
   MYSQL_ROOT_PASSWORD=root
   MYSQL_DATABASE=formation
   ```

## Installation

1. Construisez l'image Docker :
   ```bash
   docker build -t mysql-lab .
   ```

2. Lancez le conteneur :
   ```bash
   docker run -d --name mysql-container -p 3307:3306 --env-file .env mysql-lab
   ```

## Connexion à la base de données

- Hôte : localhost
- Port : 3307
- Utilisateur : root
- Mot de passe : root (ou celui défini dans .env)
- Base de données : formation

## Structure du projet

- `Dockerfile` : Configuration de l'image Docker
- `init.sql` : Script d'initialisation de la base de données
- `.env` : Variables d'environnement (non versionné)
- `.env.example` : Exemple de fichier de variables d'environnement

## Commandes utiles

- Démarrer le conteneur : `docker start mysql-container`
- Arrêter le conteneur : `docker stop mysql-container`
- Voir les logs : `docker logs mysql-container`
- Se connecter au shell MySQL : `docker exec -it mysql-container mysql -uroot -p`

## Structure de la base de données

### Table `utilisateurs`
- `id` : INT (Auto-increment, Primary Key)
- `nom` : VARCHAR(100)
- `email` : VARCHAR(255) (Unique)

## Sécurité

- Les credentials sont stockés dans le fichier `.env`
- Ne jamais commiter le fichier `.env` dans un dépôt git
- Les permissions du fichier init.sql sont restreintes 