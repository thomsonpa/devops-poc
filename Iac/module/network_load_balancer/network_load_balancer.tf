resource "aws_lb" "nlb" {
  name                       = var.name
  internal                   = var.internal
  load_balancer_type         = var.load_balancer_type
  subnets                    = var.subnet_ids
  enable_deletion_protection = var.deletion_protection
  tags                       = var.tags
}
