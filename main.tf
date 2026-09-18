terraform {
  backend "s3" {
    bucket       = "sctp-tfstate-ce13"
    key          = "jaz-31-terraform.tfstate"
    region       = "us-east-1"
  }
}

provider "aws" {
   region = "us-east-1"
}

resource "aws_s3_bucket" "workshop" {
  bucket_prefix = "jaz-31-bkt"
  tags = {
    Purpose = "github-actions-workshop"
  }
}