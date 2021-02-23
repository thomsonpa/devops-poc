resource "aws_eip" "eip" {
  vpc                       = var.vpc
  network_interface         = var.network_interface
}