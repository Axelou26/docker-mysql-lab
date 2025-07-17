terraform {
  required_providers {
    scalingo = {
      source = "Scalingo/scalingo"
      version = "~> 2.0.0"
    }
  }
}

provider "scalingo" {
  api_token = var.scalingo_token
  region    = var.scalingo_region
}

# Utiliser l'application existante au lieu d'en créer une nouvelle
data "scalingo_app" "existing_app" {
  name = var.app_name
}

# La ressource domain utilise maintenant l'application existante
resource "scalingo_domain" "app_domain" {
  app         = data.scalingo_app.existing_app.id
  common_name = var.domain_name
  count       = var.domain_name != "" ? 1 : 0
} 