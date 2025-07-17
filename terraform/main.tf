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

data "scalingo_app" "app" {
  name = var.app_name
}

# Commenté car l'application existe déjà
# resource "scalingo_app" "app" {
#   name = var.app_name
# }

resource "scalingo_domain" "app_domain" {
  app         = data.scalingo_app.app.id
  common_name = var.domain_name
  count       = var.domain_name != "" ? 1 : 0
} 