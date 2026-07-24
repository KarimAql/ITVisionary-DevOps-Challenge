module "vpc" {
  source = "./modules/vpc"

  project_name         = var.project_name
  environment          = var.environment
  vpc_cidr             = var.vpc_cidr
  public_subnet_cidrs  = var.public_subnet_cidrs
  private_subnet_cidrs = var.private_subnet_cidrs
  availability_zones   = var.availability_zones
}

module "security_groups" {
  source = "./modules/security-groups"

  project_name   = var.project_name
  environment    = var.environment
  vpc_id         = module.vpc.vpc_id
  container_port = var.container_port
}

module "iam" {
  source = "./modules/iam"

  project_name           = var.project_name
  environment            = var.environment
  ecr_repository_name    = var.ecr_repository_name
  aws_region             = var.aws_region
  account_id             = data.aws_caller_identity.current.account_id
  github_org_repo        = var.github_org_repo
  terraform_state_bucket = var.terraform_state_bucket
}

module "alb" {
  source = "./modules/alb"

  project_name      = var.project_name
  environment       = var.environment
  vpc_id            = module.vpc.vpc_id
  public_subnet_ids = module.vpc.public_subnet_ids
  alb_sg_id         = module.security_groups.alb_sg_id
  container_port    = var.container_port
  health_check_path = var.health_check_path
}

module "ecs" {
  source = "./modules/ecs"

  project_name            = var.project_name
  environment             = var.environment
  aws_region              = var.aws_region
  vpc_id                  = module.vpc.vpc_id
  private_subnet_ids      = module.vpc.private_subnet_ids
  ecs_sg_id               = module.security_groups.ecs_sg_id
  alb_target_group_arn    = module.alb.target_group_arn
  task_execution_role_arn = module.iam.task_execution_role_arn
  task_role_arn           = module.iam.task_role_arn
  ecr_repository_name     = var.ecr_repository_name
  container_image_tag     = var.container_image_tag
  container_port          = var.container_port
  ecs_task_cpu            = var.ecs_task_cpu
  ecs_task_memory         = var.ecs_task_memory
  ecs_desired_count       = var.ecs_desired_count
  ecs_min_capacity        = var.ecs_min_capacity
  ecs_max_capacity        = var.ecs_max_capacity
  cpu_scale_out_threshold = var.cpu_scale_out_threshold
}

module "monitoring" {
  source = "./modules/monitoring"

  project_name        = var.project_name
  environment         = var.environment
  aws_region          = var.aws_region
  ecs_cluster_name    = module.ecs.ecs_cluster_name
  ecs_service_name    = module.ecs.ecs_service_name
  alb_arn_suffix      = module.alb.alb_arn_suffix
  cpu_alarm_threshold = var.cpu_alarm_threshold
  alb_5xx_threshold   = var.alb_5xx_threshold
  alarm_email         = var.alarm_email
}

# Data source for account ID
data "aws_caller_identity" "current" {}
