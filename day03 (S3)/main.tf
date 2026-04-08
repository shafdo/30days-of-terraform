# TF version
terraform {
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