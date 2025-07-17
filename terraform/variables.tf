variable "scalingo_token" {
  description = "Scalingo API token"
  type        = string
  sensitive   = true
}

variable "scalingo_region" {
  description = "Scalingo region"
  type        = string
  default     = "osc-fr1"
}

variable "app_name" {
  description = "Name of the Scalingo application"
  type        = string
  default     = "docker-mysql-lab"
}

variable "domain_name" {
  description = "Custom domain for the application (optional)"
  type        = string
  default     = ""
}

variable "enable_ssl" {
  description = "Enable SSL for custom domain"
  type        = bool
  default     = true
} 