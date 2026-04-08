# TF version
terraform {

  # https://developer.hashicorp.com/terraform/language/backend/s3
  # Make the "day30-tf-bucket-state" s3 bucket manully via console or awscli. This remote backend s3 bucket is not a resource of terraform
  backend "s3" {
    bucket = "day30-tf-bucket-state"
    key    = "dev/terraform.tfstate"
    region = "ap-south-1"
    encrypt = true
    use_lockfile = true
  }

  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "6.35.0"
    }
  }
}

# Provider
provider "aws" {
  region = "ap-south-1"
}

# Resource provisioning from day 03 bellow...
# Resource: VPC
resource "aws_vpc" "day30_tf_vpc" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "Day 30 TF VPC"
    Environment = "Dev"
  }
}

# Resource: S3
resource "aws_s3_bucket" "day30_tf_bucket" {
  bucket = "day30-tf-bucket"

  tags = {
    Name        = "day30-tf-bucket"
    Environment = "Dev"
    
    # Implicit dependency
    VPCId       = aws_vpc.day30_tf_vpc.id
  }
}