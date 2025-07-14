terraform {
  backend "s3" {
    bucket         = "tfstatesec1"
    key            = "state/security-account.tfstate"
    region         = "eu-west-1"
  }
}
