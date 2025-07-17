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

# L'application docker-mysql-lab existe déjà sur Scalingo
# et est gérée manuellement 