variable "project_id" {
  type        = string
  description = "The GCP project ID"
}

variable "region" {
  type        = string
  default     = "us-east1"
  description = "The region you want your assets to be created and hosted from"
}

# variable "deploy_bucket" {
#   type        = string
#   description = "The cloud storage deployment bucket for your entire project"
# }

# variable "deploy_prefix" {
#   type        = string
#   description = "For local/dev deployments consider using your name or nickname"
# }

variable "atlas_org_id" {
  type        = string
  description = "Atlas organization id"
}

variable "atlas_project_name" {
  type        = string
  description = "Atlas project name"
}

variable "atlas_region" {
  type        = string
  description = "GCP region where resources will be created"
  # This is to access the M0 Serverless option. CHnage it to your needs
  default     = "CENTRAL_US"
}

variable "db_password" {
  type        = string
  description = "DB password"
}

variable "db_user" {
  type        = string
  description = "DB user"
}

# variable "db_host" {
#   type        = string
#   description = "DB host. Should be like: mongodb+srv://<project_name>.<abc123>.mongodb.net"
# }

# variable "deploy_env" {
#   type = string
#   description = "The environment you're deploying to"
#   default = "dev"

#   validation {
#     condition     = contains(["dev", "staging", "prod"], var.deploy_env)
#     error_message = "Valid values for deploy_env are \"dev\", \"staging\", and \"prod\"."
#   }
# }

# # Local deployment only. The main.tfvars file is in the .gitignore on purpose 
# so your keys will stay on your computer, but I do not recommend using 
# variables for pub/priv keys.
variable "atlas_public_key" {
  type        = string
  description = "MongoDB Atlas Public Key"
  default     = null
}

variable "atlas_private_key" {
  type        = string
  description = "MongoDB Atlas Private Key"
  default     = null
}

variable "db_instance_name" {
  type        = string
  description = "DB instance name"
}
