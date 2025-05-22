# terraform-aws-ecr

[![Lint Status](https://github.com/tothenew/terraform-aws-template/workflows/Lint/badge.svg)](https://github.com/tothenew/terraform-aws-template/actions)
[![LICENSE](https://img.shields.io/github/license/tothenew/terraform-aws-template)](https://github.com/tothenew/terraform-aws-template/blob/master/LICENSE)


## Introduction

This Terraform module provisions one or more AWS Elastic Container Registry (ECR) repositories with configurable settings such as image tag mutability, scan-on-push, encryption, and lifecycle policies.

## Explanation of Module

The module dynamically creates multiple ECR repositories using a list of repository names. Each repository can have scanning enabled on push, tag mutability set, encryption configured, and a lifecycle policy applied to manage image cleanup automatically.

## Resources Created and Managed by This Module

- `aws_ecr_repository`
- `aws_ecr_lifecycle_policy`

## Example Usage

```hcl
module "ecr" {
  source               = "git::https://github.com/tothenew/terraform-aws-ecr.git"
  image_tag_mutability = "MUTABLE"
  encryption_type      = "AES256"
  scan_on_push         = false
  lifecycle_policy     = local.lifecycle_policy
  ecrName              = ["test", "test2"]
}

```

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.3.0 |

## Providers

No providers.

## Modules

No modules.

## Resources

No resources.

## Inputs

No inputs.

## Outputs

No outputs.
<!-- END_TF_DOCS -->

## Authors

Module managed by [TO THE NEW Pvt. Ltd.](https://github.com/tothenew)

## License

Apache 2 Licensed. See [LICENSE](https://github.com/tothenew/terraform-aws-template/blob/main/LICENSE) for full details.
