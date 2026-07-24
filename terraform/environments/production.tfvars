# This file contains only the non-sensitive variables, it serves as a single source of truth for the environment
aws_region   = "us-east-1"
project_name = "devops-challenge"
environment  = "production"

vpc_cidr             = "10.0.0.0/16"
public_subnet_cidrs  = ["10.0.1.0/24", "10.0.2.0/24"]
private_subnet_cidrs = ["10.0.3.0/24", "10.0.4.0/24"]
availability_zones   = ["us-east-1a", "us-east-1b"]

ecr_repository_name = "devops-challenge-app"
container_port      = 5000

ecs_task_cpu            = 256
ecs_task_memory         = 512
ecs_desired_count       = 1
ecs_min_capacity        = 1
ecs_max_capacity        = 2
cpu_scale_out_threshold = 70

github_org_repo        = "KarimAql@101567931/ITVisionary-DevOps-Challenge@1311232220"
terraform_state_bucket = "karim-state-bucket"

health_check_path   = "/health"
cpu_alarm_threshold = 70
alb_5xx_threshold   = 10

# alarm_email is set as a Github action secret here since it's sensitive

