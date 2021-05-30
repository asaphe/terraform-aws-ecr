resource "aws_ecr_lifecycle_policy" "this" {
  repository = var.repository
  policy     = var.policy
}