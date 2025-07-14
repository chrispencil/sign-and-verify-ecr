terraform {
  backend "s3" {
    bucket         = "tfstateapp1"
    key            = "state/app-account.tfstate"
    region         = "eu-west-1"
  }
}