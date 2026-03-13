output "repository" {
  description = "The name of the repository."
  value       = aws_ecr_repository_policy.this.repository
}

output "repository_policy" {
  description = "The repository policy."
  value       = aws_ecr_repository_policy.this.policy
}

output "registry_id" {
  description = "The registry ID where the repository was created."
  value       = aws_ecr_repository_policy.this.registry_id
}
