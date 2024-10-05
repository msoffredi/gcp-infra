# Deploying Terraform code with GitHub Actions using OIDC

We recommend reading [this LinkedIn Article](https://www.linkedin.com/pulse/deploy-terraform-code-using-github-actions-openid-connect-chandio-brwbf/) about how to configure your GitHub repositorries to a GCP Project/Account.

Note: the instructions above are per project, so if you configure staging and production on separate projects, you will have to repeat the configuration for every project.

## IAM Roles needed

In the deocument shared above there's a section about assigning roles to your service account. These roles depend on the services you need to manage through Terraform. In our case the roles you need to consider are:

-   `roles/storage.admin`
-   `roles/resourcemanager.projectIamAdmin`
-   `roles/iam.serviceAccountAdmin`
-   `roles/iam.roleAdmin`
-   `roles/iam.serviceAccountTokenCreator`
-   `roles/iam.serviceAccountUser`
-   `roles/compute.admin`

## DNS considerations

If you handle DNS in one project but run a deploy GitHub Action on another project, you will need to grant your service account permission across projects. To do that you have to:

-   Go to the target project, IAM, Service Accounts, and copy the service account email address
-   Switch to the project where the DNS is managed
-   Go to IAM and add a new access by using the email address you copied, and grant the role `roles/dns.admin`
