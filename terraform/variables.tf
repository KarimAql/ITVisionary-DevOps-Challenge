variable "aws_region" {
  description = "AWS region to deploy resources into."
  type        = string
  default     = "us-east-1"
}

variable "project_name" {
  description = "Short name used to prefix all resource names."
  type        = string
  default     = "devops-challenge"
}

variable "environment" {
  description = "Deployment environment (e.g. dev, staging, production)."
  type        = string
  default     = "production"
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC."
  type        = string
  default     = "10.0.0.0/16"
}

variable "public_subnet_cidrs" {
  description = "CIDR blocks for the two public subnets."
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "private_subnet_cidrs" {
  description = "CIDR blocks for the two private subnets."
  type        = list(string)
  default     = ["10.0.3.0/24", "10.0.4.0/24"]
}

variable "availability_zones" {
  description = "List of two AZs to spread resources across."
  type        = list(string)
  default     = ["us-east-1a", "us-east-1b"]
}


variable "ecr_repository_name" {
  description = "Name of the ECR repository that holds the application image."
  type        = string
  default     = "devops-challenge-app"
}

variable "container_image_tag" {
  description = "Docker image tag to deploy (overridden by CI/CD)."
  type        = string
  default     = "latest"
}

variable "container_port" {
  description = "Port the container listens on."
  type        = number
  default     = 5000
}

variable "ecs_task_cpu" {
  description = "CPU units for each Fargate task (256 = 0.25 vCPU)."
  type        = number
  default     = 256
}

variable "ecs_task_memory" {
  description = "Memory (MiB) for each Fargate task."
  type        = number
  default     = 512
}

variable "ecs_desired_count" {
  description = "Desired number of running ECS tasks."
  type        = number
  default     = 2
}

variable "ecs_min_capacity" {
  description = "Minimum number of ECS tasks for auto scaling."
  type        = number
  default     = 1
}

variable "ecs_max_capacity" {
  description = "Maximum number of ECS tasks for auto scaling."
  type        = number
  default     = 4
}

variable "cpu_scale_out_threshold" {
  description = "CPU utilisation (%) that triggers a scale-out."
  type        = number
  default     = 70
}

variable "health_check_path" {
  description = "HTTP path used by the ALB target group health check."
  type        = string
  default     = "/health"
}

variable "github_org_repo" {
  description = "GitHub org/repo used to scope the OIDC trust."
  type        = string
}

variable "terraform_state_bucket" {
  description = "Name of the S3 bucket used for Terraform remote state."
  type        = string
}

variable "alarm_email" {
  description = "E-mail address to receive CloudWatch alarm notifications (leave blank to skip SNS)."
  type        = string
  default     = ""
}

variable "cpu_alarm_threshold" {
  description = "CPU utilisation (%) that triggers the CloudWatch high-CPU alarm."
  type        = number
  default     = 70
}

variable "alb_5xx_threshold" {
  description = "Number of ALB 5XX responses per evaluation period that triggers an alarm."
  type        = number
  default     = 10
}
