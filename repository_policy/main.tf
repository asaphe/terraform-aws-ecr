resource "aws_ecr_repository_policy" "this" {
  repository = var.repository
  policy     = var.policy
}