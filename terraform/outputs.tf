output "app_name" {
  description = "Nom de l'application Scalingo déployée"
  value       = scalingo_app.app.name
} 