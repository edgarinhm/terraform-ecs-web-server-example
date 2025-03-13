resource "aws_ecr_repository" "poweredge-web-ecr" {
  name                 = "poweredge-web-ecr-tf"
  image_tag_mutability = "MUTABLE"
  image_scanning_configuration {
    scan_on_push = true
  }
  tags = {
    Environment = "staging"
  }
}
