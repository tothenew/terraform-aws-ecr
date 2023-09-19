locals {
  lifecycle_policy = {
    rules = [
      {
        rulePriority = 1
        description  = "Expire untagged images older than 30 days"
        selection = {
          tagStatus   = "untagged"
          countType   = "sinceImagePushed"
          countUnit   = "days"
          countNumber = 30
        }
        action = {
          type = "expire"
        }
      },
      {
        rulePriority = 2
        description  = "Keep 10 most recent tagged images"
        selection = {
          tagStatus     = "tagged"
          countType     = "imageCountMoreThan"
          countNumber   = 10
          tagPrefixList = ["your-tag-prefix"]  # Replace with your actual tag prefix
        }
        action = {
          type = "expire"
        }
      }
    ]
  }
}

######################## Module ######################

module "ecr" {
  source               = "git::https://github.com/tothenew/terraform-aws-ecr.git"
  image_tag_mutability = local.workspace.image_tag_mutability
  encryption_type      = local.workspace.encryption_type
  scan_on_push         = local.workspace.scan_on_push
  lifecycle_policy     = local.lifecycle_policy
  ecrName              = local.workspace.ecrName
}