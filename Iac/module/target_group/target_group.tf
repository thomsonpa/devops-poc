resource "aws_lb_target_group" "target" {
  name     = var.name
  port     = var.port
  protocol = var.protocol
  vpc_id   = var.vpc_id
  tags     = var.tags
}