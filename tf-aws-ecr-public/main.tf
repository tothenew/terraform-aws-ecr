resource "aws_ecrpublic_repository" "public_ecr" {
  for_each = { for idx, name in var.repository_names : name => idx }

  repository_name = each.key
  catalog_data {
    description = var.catalog_data[each.key].description
  }
  tags = var.tags
}
