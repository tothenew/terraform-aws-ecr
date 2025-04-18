output "repository_urls" {
  description = "Map of repository names to their public URLs"
  value = {
    for name, repo in aws_ecrpublic_repository.public_ecr :
    name => repo.repository_uri
  }
}
