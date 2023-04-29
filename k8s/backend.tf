terraform {
  backend "s3" {
    bucket = "sergio-tf-backend"
    key    = "k8s/terraform.tfstate"
    region = "us-east-1"
  }
}
