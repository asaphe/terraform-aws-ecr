variable "region" {
  type        = string
  description = "(Required) A Region to replicate to."
}

variable "registry_id" {
  type        = string
  description = "(Required) The account ID of the destination registry to replicate to."
}