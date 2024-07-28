locals {
    _version = "0.1.0"
}

terraform {
    required_version = ">= 1.9"
}

data "google_project" "project" {
    project_id = var.project_id
}

resource "google_storage_bucket" "deploy_bucket" {
    provider      = google
    location      = var.region
    name          = var.deploy_bucket
    force_destroy = false
    
    # Use "US" or similar for multi-region  
    storage_class = "STANDARD"

    versioning {
        enabled = true
    }
}

resource "google_project_iam_binding" "storage_obj_admin_permission" {
    project = var.project_id
    role = "roles/cloudbuild.builds.builder"
    members = [
        "serviceAccount:${data.google_project.project.number}-compute@developer.gserviceaccount.com"
    ]
}
