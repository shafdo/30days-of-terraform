terraform {
  backend "s3" {
    bucket = "day30-tf-bucket-state"
    key    = "dev/day08/terraform.tfstate"
    region = "ap-south-1"
    encrypt = true
    use_lockfile = true
  }
}