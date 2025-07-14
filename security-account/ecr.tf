resource "aws_ecr_pull_through_cache_rule" "dockerhub" {
  ecr_repository_prefix = "dockerhub"
  upstream_registry_url = "registry-1.docker.io"
  credential_arn        = "arn:aws:secretsmanager:eu-west-1:{security-accountid}:secret:ecr-pullthroughcache/dockerhub-1234"
}

#Signed Mirror ECR Repos
locals {
  signed_base_images = ["alpine", "ubuntu", "node"]
}

resource "aws_ecr_repository" "signed_base_images" {
  for_each = toset(local.signed_base_images)

  name                 = "signed-base-images/${each.value}"
  image_tag_mutability = "MUTABLE"

  encryption_configuration {
    encryption_type = "AES256"
  }

  lifecycle {
    ignore_changes = [image_scanning_configuration]
  }
}
