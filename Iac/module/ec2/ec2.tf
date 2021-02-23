resource "aws_instance" "instance" {
  ami                         = var.ami
  instance_type               = var.instance_type
  key_name                    = var.key_name
  monitoring                  = var.montioring 
  iam_instance_profile        = var.iam_instance_profile
  vpc_security_group_ids      = var.security_groups
  user_data                   = var.userdata
  subnet_id                   = var.subnet_id 
  tags                        = var.tags

  
}