# Docker MySQL Lab

Ce projet configure une instance MySQL dans un conteneur Docker avec une base de données préconfigurée.

## Structure du projet

```
docker-mysql-lab/
├── Dockerfile
├── init.sql
├── .env
└── README.md
```

- `Dockerfile` : Configuration de l'image MySQL
- `init.sql` : Script d'initialisation de la base de données
- `.env` : Variables d'environnement (à ne pas commiter dans un vrai projet)

## Prérequis

- Docker installé sur votre machine
- Docker Compose (optionnel)

## Installation et démarrage

1. Cloner le projet :
```bash
git clone [URL_DU_REPO]
cd docker-mysql-lab
```

2. Configurer les variables d'environnement :
   - Copier le fichier `.env.example` vers `.env` (si applicable)
   - Modifier les valeurs dans le fichier `.env`

3. Construire l'image :
```bash
docker build -t mysql-lab .
```

4. Lancer le conteneur :
```bash
docker run -d -p 3306:3306 --env-file .env --name mysql-container mysql-lab
```

## Vérification

1. Se connecter au conteneur :
```bash
docker exec -it mysql-container mysql -uroot -p
```

2. Vérifier la base de données :
```sql
USE formation;
SHOW TABLES;
DESCRIBE utilisateurs;
```

## Structure de la base de données

### Table `utilisateurs`
- `id` : INT (Auto-increment, Primary Key)
- `nom` : VARCHAR(100)
- `email` : VARCHAR(255) (Unique)

## Sécurité

- Les credentials sont stockés dans le fichier `.env`
- Ne jamais commiter le fichier `.env` dans un dépôt git
- Les permissions du fichier init.sql sont restreintes 