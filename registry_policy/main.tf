resource "aws_ecr_registry_policy" "this" {
  policy = var.policy
}