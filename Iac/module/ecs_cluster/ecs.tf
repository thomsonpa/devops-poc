resource "aws_ecs_cluster" "cluster" {
  name = var.name
  tags = var.tags
}