# terraform-aws-ecr

A collection of Terraform modules for AWS Elastic Container Registry (ECR).

## Modules

| Module | Description |
|--------|-------------|
| [repository](./repository) | Create an ECR repository with encryption, image scanning, and tag mutability settings |
| [lifecycle_policy](./lifecycle_policy) | Attach a lifecycle policy to an ECR repository |
| [registry_policy](./registry_policy) | Set a registry-level IAM policy |
| [replication_configuration](./replication_configuration) | Configure cross-region or cross-account replication |
| [repository_policy](./repository_policy) | Attach a repository-level IAM policy |

## Usage

### Basic Repository

```hcl
module "ecr" {
  source = "github.com/asaphe/terraform-aws-ecr//repository?ref=v2.0.0"

  name                 = "my-app"
  image_tag_mutability = "IMMUTABLE"
  scan_on_push         = true

  tags = {
    Environment = "production"
    ManagedBy   = "terraform"
  }
}
```

### Repository with KMS Encryption

```hcl
module "ecr" {
  source = "github.com/asaphe/terraform-aws-ecr//repository?ref=v2.0.0"

  name            = "my-app"
  encryption_type = "KMS"
  kms_key         = aws_kms_key.ecr.arn
  scan_on_push    = true
}
```

### Repository with Lifecycle Policy

```hcl
module "ecr_repo" {
  source = "github.com/asaphe/terraform-aws-ecr//repository?ref=v2.0.0"

  name         = "my-app"
  scan_on_push = true
}

module "ecr_lifecycle" {
  source = "github.com/asaphe/terraform-aws-ecr//lifecycle_policy?ref=v2.0.0"

  repository = module.ecr_repo.repository_url
  policy     = jsonencode({
    rules = [{
      rulePriority = 1
      description  = "Keep last 30 images"
      selection = {
        tagStatus   = "any"
        countType   = "imageCountMoreThan"
        countNumber = 30
      }
      action = {
        type = "expire"
      }
    }]
  })
}
```

## Requirements

| Name | Version |
|------|---------|
| terraform | >= 1.5.7 |
| aws | >= 5.0 |

## Submodule Inputs

### repository

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|----------|
| name | Name of the repository | `string` | - | yes |
| image_tag_mutability | Tag mutability setting. Must be MUTABLE or IMMUTABLE | `string` | `"MUTABLE"` | no |
| encryption_type | Encryption type. Valid values are AES256 or KMS | `string` | `"AES256"` | no |
| kms_key | ARN of the KMS key when encryption_type is KMS | `string` | `null` | no |
| scan_on_push | Whether images are scanned after being pushed | `bool` | `true` | no |
| tags | A map of tags to assign to the resource | `map(string)` | `null` | no |
| repository_delete_timeout | How long to wait for a repository to be deleted | `string` | `"20m"` | no |

### lifecycle_policy

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|----------|
| repository | Name of the repository to apply the policy | `string` | - | yes |
| policy | The policy document as a JSON formatted string | `string` | - | yes |

### registry_policy

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|----------|
| policy | The policy document as a JSON formatted string | `string` | - | yes |

### replication_configuration

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|----------|
| replication_configuration | Replication configuration for a registry | `any` | - | yes |

### repository_policy

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|----------|
| repository | Name of the repository to apply the policy | `string` | - | yes |
| policy | The policy document as a JSON formatted string | `string` | - | yes |

## Outputs

### repository

| Name | Description |
|------|-------------|
| arn | Full ARN of the repository |
| registry_id | The registry ID where the repository was created |
| repository_url | The URL of the repository |

### repository_policy

| Name | Description |
|------|-------------|
| repository | The name of the repository |
| repository_policy | The repository policy |
| registry_id | The registry ID where the repository was created |

## License

Apache 2.0 - See [LICENSE](LICENSE) for details.
