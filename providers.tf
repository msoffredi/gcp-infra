terraform {
  required_providers {
    google = {
        source  = "hashicorp/google"
        version = "~> 5.38.0"
    }

    mongodbatlas = {
        source = "mongodb/mongodbatlas"
        version = "~> 1.17.4"
    }
  }
}

provider "google" {
    project = var.project_id
    region  = var.region
}

provider "mongodbatlas" {
    # These keys will default to null in case you don't provide them and Terraform
    # will try to get them from the environment variables.
    public_key  = var.atlas_public_key
    private_key = var.atlas_private_key
}
