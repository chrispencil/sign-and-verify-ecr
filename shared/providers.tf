provider "aws" {
  region = "eu-west-1"
  alias  = "security"

  assume_role {
    role_arn = "arn:aws:iam::{security-accountid}:role/centralecrsec"
  }
}

provider "aws" {
  region = "eu-west-1"
  alias  = "app"

  assume_role {
    role_arn = "arn:aws:iam::{security-accountid}:role/centralecr"
  }
}

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 5.24.0"
    }
  }
}
