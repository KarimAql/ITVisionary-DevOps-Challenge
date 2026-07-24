variable "project_name" {
  type = string
}

variable "environment" {
  type = string
}

variable "aws_region" {
  type = string
}

variable "account_id" {
  type = string
}

variable "ecr_repository_name" {
  type = string
}

variable "github_org_repo" {
  description = "GitHub org/repo used to scope the OIDC trust (e.g. KarimAql/ITVisionary-DevOps-Challenge)."
  type        = string
  default     = "my-org/my-repo"
}

variable "terraform_state_bucket" {
  description = "Name of the S3 bucket used for Terraform remote state."
  type        = string
}
