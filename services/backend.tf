terraform {
  backend "s3" {
    bucket = "sergio-tf-backend"
    key    = "services/terraform.tfstate"
    region = "us-east-1"
  }
}
