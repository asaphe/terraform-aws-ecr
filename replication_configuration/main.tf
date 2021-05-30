resource "aws_ecr_replication_configuration" "this" {
  replication_configuration {
    rule {
      destination {
        region      = var.region
        registry_id = var.registry_id
      }
    }
  }
}