# Déploiement Continu avec Terraform et GitHub Actions sur Scalingo

Ce projet montre comment configurer un déploiement continu d'une application sur Scalingo en utilisant Terraform pour provisionner l'infrastructure et GitHub Actions pour automatiser le déploiement.

## Structure du projet

```
.
├── .github/
│   └── workflows/
│       ├── terraform_scalingo_provision.yml  # Workflow pour provisionner l'environnement
│       └── scalingo_deploy.yml               # Workflow pour déployer l'application
├── app/
│   ├── index.html                            # Page d'accueil de l'application
│   ├── style.css                             # Feuille de style CSS
│   ├── Procfile                              # Configuration pour Scalingo
│   └── composer.json                         # Configuration PHP (même pour app statique)
└── terraform/
    ├── main.tf                               # Configuration principale Terraform
    ├── variables.tf                          # Déclaration des variables
    └── outputs.tf                            # Sorties de configuration
```

## Prérequis

- Un compte GitHub
- Un compte Scalingo
- Un token d'API Scalingo

## Configuration

1. **Créez une branche `prod` dans votre dépôt GitHub**

   ```bash
   git checkout -b prod
   ```

2. **Configurez les secrets GitHub Actions**

   Dans votre dépôt GitHub, allez dans "Settings" > "Secrets and variables" > "Actions" et ajoutez :
   - `SCALINGO_TOKEN` : Votre token d'API Scalingo

3. **Configurez les variables d'environnement (optionnel)**

   Dans votre dépôt GitHub, allez dans "Settings" > "Secrets and variables" > "Actions" > "Variables" et ajoutez :
   - `SCALINGO_APP_NAME` : Le nom de votre application sur Scalingo (doit correspondre au nom défini dans variables.tf)

## Déploiement

Le déploiement se déroule automatiquement lorsque vous poussez des modifications sur la branche `prod` :

1. Le workflow `terraform_scalingo_provision.yml` s'exécute pour provisionner ou mettre à jour l'environnement Scalingo.
2. Une fois terminé avec succès, le workflow `scalingo_deploy.yml` s'exécute pour déployer la dernière version de l'application.

## Test Local

Pour tester Terraform localement avant de pousser vos modifications :

1. Installez Terraform si ce n'est pas déjà fait.
2. Configurez une variable d'environnement pour votre token Scalingo :
   ```bash
   export TF_VAR_scalingo_token="votre-token-scalingo"
   ```
3. Initialisez et appliquez la configuration Terraform :
   ```bash
   cd terraform
   terraform init
   terraform plan
   terraform apply
   ```

## Personnalisation

- Modifiez les fichiers dans le dossier `app/` pour personnaliser votre application
- Ajustez les variables dans `terraform/variables.tf` pour personnaliser votre configuration Scalingo 