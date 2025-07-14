resource "aws_ecr_repository" "app1" {
  name                 = "app1-repo/alpine"
  image_tag_mutability = "IMMUTABLE"
  encryption_configuration {
    encryption_type = "AES256"
  }
}

resource "aws_ecr_repository" "app1" {
  name                 = "app1-repo/ubuntu"
  image_tag_mutability = "IMMUTABLE"
  encryption_configuration {
    encryption_type = "AES256"
  }
}
