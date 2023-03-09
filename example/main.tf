module "ecr" {
    source               = "../"
    image_tag_mutability = "MUTABLE"
    encryption_type      = "AES256"
    scan_on_push         = false
    ecrName              = ["test","test2"]
}