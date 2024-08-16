cat > backend.tf << EOF
terraform {
    backend "gcs" {
        bucket = "$DEPLOY_BUCKET"
        prefix = "terraform/gcp-infra-state"  
    }
}
EOF
