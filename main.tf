resource "aws_ecr_repository" "ecr" {
  for_each             = { for i, ecr in var.ecrName: ecr => i }
  name                 = each.key
  image_tag_mutability = var.image_tag_mutability

  image_scanning_configuration {
    scan_on_push = var.scan_on_push
  }
  encryption_configuration {
    encryption_type = var.encryption_type
  }
}

resource "aws_ecr_lifecycle_policy" "auto-remove" {
  for_each   = { for i, ecr in var.ecrName: ecr => i }

  repository = aws_ecr_repository.ecr[each.key].id
  policy     = jsonencode(var.lifecycle_policy)

  depends_on = [aws_ecr_repository.ecr]
}
