resource "aws_ecr_repository" "ecr" {
  count = length(var.ecrName)
  name                 = "${var.ecrName[count.index]}"
  image_tag_mutability = var.image_tag_mutability

  image_scanning_configuration {
    scan_on_push = false
  }
  encryption_configuration {
    encryption_type = var.encryption_type
  }

}

resource "aws_ecr_lifecycle_policy" "auto-remove" {
  count = length(var.ecrName)
  repository = aws_ecr_repository.ecr[count.index].id
  policy     = file("${path.module}/ecr_lifecycle_policy.json")
}


