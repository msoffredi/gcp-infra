# Foundational terraform for the GCP-\* project

This reporsitory has foundational terraform to deploy common infrastructure needed by all `gcp-*` projects/services. This terraform should be deployed before all others.

## Runnint terraform locally

### Pre-requisites

1. Terraform 1.9 or higher
2. You have a GCP account with billing configured
3. You have the following GCP APIs and Services enabled in your project:
    - Cloud Build API
    - Cloud Run Admin API
    - Artifact Registry API
    - Cloud Functions API
    - Cloud Storage API
    - API Gateway API
    - Service Control API
    - MongoDB Atlas (with valid org and project. See the [variables.tf file](variables.tf) for data you need from your MongoDB Atlas instance)
4. You copy `backend.tf.example` to `backend.tf` and update as needed (no update needed for local deploy)
5. You copy `main.tfvars.example` to `main.tfvars` and update accordingly

### Deploying for local/dev

If you are deploying for the first time you will need to initialize terraform:

```
> terraform init
```

Then to deploy changes on a regular basis you just do

```
> terraform apply -auto-approve -var-file="main.tfvars"
```

### Destroying for local/dev

Since this terraform is foundational for other services, you must destroy all other services before you attempt to successfully destroy this one.

```
> terraform destroy -auto-approve -var-file="main.tfvars"
```
