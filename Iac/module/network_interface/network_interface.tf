resource "aws_network_interface" "nic" {
  subnet_id         = var.subnet_id
  description       = var.description
  source_dest_check = var.source_dest_check
  
}