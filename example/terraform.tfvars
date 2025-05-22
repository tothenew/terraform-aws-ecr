ecrName = ["test1", "test2"]

scan_on_push = true

image_tag_mutability = "MUTABLE"

encryption_type = "AES256"

lifecycle_policy = {
  rules = [
    {
      rulePriority = 10
      description  = "Keep only the last 20 images"
      action = {
        type = "expire"
      }
      selection = {
        tagStatus   = "any"
        countType   = "imageCountMoreThan"
        countNumber = 20
      }
    },
    {
      rulePriority = 1
      description  = "Expire untagged images older than 14 days"
      action = {
        type = "expire"
      }
      selection = {
        tagStatus   = "untagged"
        countType   = "sinceImagePushed"
        countUnit   = "days"
        countNumber = 14
      }
    }
  ]
}
