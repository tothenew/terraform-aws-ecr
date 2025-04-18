variable "repository_names" {
  type        = list(string)
  description = "List of public ECR repository names to create"
}

variable "catalog_data" {
  type = map(object({
    description = string
  }))
  description = "Map of catalog data for each repository"
}

variable "tags" {
  type        = map(string)
  description = "Tags to apply to the repositories"
}
