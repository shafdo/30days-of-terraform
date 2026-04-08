terraform {

  backend "s3" {
    bucket = "day30-tf-bucket-state"
    key    = "dev/day05/terraform.tfstate"
    region = "ap-south-1"
    encrypt = true
    use_lockfile = true
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.7.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "~> 3.1"
    }
  }
  required_version = ">= 1.0"
}

provider "aws" {
  region = "ap-south-1"
}