variable "name" {
  type        = string
  description = "(Required) Name of the repository."
}

variable "image_tag_mutability" {
  type        = string
  description = "(Optional) The tag mutability setting for the repository. Must be one of: MUTABLE or IMMUTABLE. Defaults to MUTABLE."
  default     = "MUTABLE"
}

variable "encryption_type" {
  type        = string
  description = "(Optional) The encryption type to use for the repository. Valid values are AES256 or KMS. Defaults to AES256."
  default     = "AES256"
}

variable "kms_key" {
  type        = string
  description = "(Optional) The ARN of the KMS key to use when encryption_type is KMS. If not specified, uses the default AWS managed key for ECR."
  default     = null
}

variable "scan_on_push" {
  type        = bool
  description = "(Required) Indicates whether images are scanned after being pushed to the repository (true) or not scanned (false)."
  default     = true
}

variable "tags" {
  type        = map(string)
  description = "(Optional) A map of tags to assign to the resource."
  default     = null
}

variable "repository_delete_timeout" {
  type        = string
  description = "(Default 20 minutes) How long to wait for a repository to be deleted."
  default     = "20m"
}