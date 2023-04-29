resource "aws_s3_bucket" "this" {
  bucket = "sergio-kops"

  tags = {
    Name        = "sergio-kops"
  }
}

resource "aws_route53_zone" "this" {
  name = "henriques.live" # update with your desired domain name
}

module "kops" {
    source = "./kops/"
}