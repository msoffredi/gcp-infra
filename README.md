# Foundational terraform for the GCP-\* project

This reporsitory has foundational terraform to deploy common infrastructure needed by all `gcp-*` projects/services. This terraform should be deployed before all others.

## Running terraform locally

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
    - IAM Service Account Credentials API
    - Cloud Resource Manager API
    - Compute Engine API
    - MongoDB Atlas (with valid org and project. See the [variables.tf file](variables.tf) for data you need from your MongoDB Atlas instance)
4. You have a deployment bucket and know the bucket name
5. You copy `backend.tf.example` to `backend.tf` and update as needed (no update needed for local deploy)
6. You copy `main.tfvars.example` to `main.tfvars` and update accordingly

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

## Other terraform considerations

### Cloud-based terraform state

If you prefer to retain your terraform states in the cloud, consider uncommenting the configuration in your `backend.tf` (from the repository's `backend.tf.example`) and adjust your preferred bucket and prefix as needed.

Note: if you want to use your newly created bucket for deployments, you will have to first deploy from local and then adjust the bucket since you need the backend configured to deploy the bucket and requiring on first deploy will result into a cyclic dependency.

### Deploy prefix

The deploy prefix is meant to solve a challenge of sharing the same workspace (project) by multiple users/developers. For dev/local purposes we suggest you use a nickname or a name. The goal is to prevent duplicated prefix because they will conflict during deployment. I would use `marcelo` or `msoffredi`. This can also help if you want to deploy a staging environment coexisting with your dev or production environments (althought I would recommend a separate project per each environment you want to deploy). So for staging you can use `stage` or `staging`. For production you don't need any prefix and that's contenplated by the terraform config files already.

### MongoDB Atlas public and private keys

Terraform MongoDB Atlas provider requires a public and a private key configured at the provider level in order to be able to provision MongoDB resourses through Terraform. While we provide an easy and simple way to manage these keys for dev and local environments (through terraform variables), a more secure way using environment variables is recommended, and highly encouraged for staging and/or production environmets.

In case you would like to use environment variables, you should use `MONGODB_ATLAS_PUBLIC_KEY` for the public key and `MONGODB_ATLAS_PRIVATE_KEY` for the private one. In this case you need to make sure you are not providing any values to the terraform variables `atlas_public_key` and `atlas_private_key` which will default to null and Terraform will try to get these values from the environment variables instead.

Consider learning more about this [here](https://registry.terraform.io/providers/mongodb/mongodbatlas/latest/docs) before you adjust your production configurations.
