terraform {

  backend "s3" {

    bucket = "ultimate-platform-terraform-state"

    key = "prod/terraform.tfstate"

    region = "ap-south-1"

    dynamodb_table = "ultimate-platform-terraform-lock"

    encrypt = true
  }
}