variable "repository" {
  type        = string
  description = "(Required) Name of the repository to apply the policy."
}

variable "policy" {
  description = "(Required) The policy document. This is a JSON formatted string. See more details about Policy Parameters in the official AWS docs. For more information about building IAM policy documents with Terraform, see the AWS IAM Policy Document Guide."
}