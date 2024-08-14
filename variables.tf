variable "project_id" {
  type        = string
  description = "The GCP project ID"
}

variable "region" {
  type        = string
  default     = "us-east1"
  description = "The region you want your assets to be created and hosted from"
}

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
