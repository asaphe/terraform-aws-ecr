output "repository" {
  description = "The name of the repository."
  value       = aws_ecr_repository_policy.this.repository
}

output "registry_id" {
  description = "The registry ID where the repository was created."
  value       = aws_ecr_repository_policy.this.registry_id
}