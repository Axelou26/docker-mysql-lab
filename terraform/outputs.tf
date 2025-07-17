output "app_id" {
  description = "ID of the provisioned Scalingo application"
  value       = scalingo_app.app.id
}

output "app_url" {
  description = "URL of the deployed application"
  value       = scalingo_app.app.url
}

output "git_url" {
  description = "Git URL for manual deployment"
  value       = scalingo_app.app.git_url
} 