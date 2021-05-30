output "registry_id" {
  description = "The registry ID where the registry was created."
  value       = aws_ecr_registry_policy.this.registry_id
}