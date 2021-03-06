resource "aws_ecs_service" "service" {
  name                                = var.name
  launch_type                         = var.launch_type
  scheduling_strategy                 = var.scheduling_strategy
  deployment_maximum_percent          = var.deployment_maximum_percent
  deployment_minimum_healthy_percent  = var.deployment_minimum_healthy_percent 
  cluster                             = var.cluster
  task_definition                     = var.task_definition
  desired_count                       = var.desired_count
  iam_role                            = var.iam_role
  

  load_balancer {
    target_group_arn = var.target_group_arn
    container_name   = var.container_name
    container_port   = var.container_port
  }
}