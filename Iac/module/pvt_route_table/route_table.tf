resource "aws_route_table" "route_table" {
  vpc_id = var.vpc_id
  tags   = var.tags

  route {
    cidr_block     = var.cidr_block
    nat_gateway_id = var.nat_gateway_id
  }
}