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

# Création de l'application Scalingo via Terraform
resource "scalingo_app" "app" {
  name = var.app_name
} 