#Resource definition for Subnet creation
resource "aws_subnet" "subnet" {
  vpc_id                  = var.vpc_id
  availability_zone       = var.availability_zone
  map_public_ip_on_launch = var.map_public_ip_on_launch
  cidr_block              = var.cidr_block
  tags                    = var.tags
}