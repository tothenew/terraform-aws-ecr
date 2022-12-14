locals {
  lifecycle_policy = {
    rules = [{
      rulePriority = 10
      description  = "keep last 20 images"
      action = {
        type = "expire"
      }
      selection = {
        tagStatus   = "any"
        countType   = "imageCountMoreThan"
        countUnit   = "days"
        countNumber = 30
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
        countNumber = 1
      }
    }]
  }
}


######################## Module ######################

module "ecr" {
    source               = "./modules/" 
    image_tag_mutability = "MUTABLE"
    encryption_type      = "AES256"
    scan_on_push         = false
    lifecycle_policy     = local.lifecycle_policy
    ecrName              = ["test","test2"]
}