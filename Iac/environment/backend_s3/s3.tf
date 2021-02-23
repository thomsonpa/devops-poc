resource "aws_s3_bucket" "tf_state" {
  bucket = "terraform-state-test-growth"
  acl    = "private"

  tags = {
    Name        = "terraform-state-test-growth"
    Environment = "POC"
  }
}
resource "aws_dynamodb_table" "terraform_locks" {
  name         = "terraform-state-lock"
  billing_mode = "PAY_PER_REQUEST"
  read_capacity = 20
  write_capacity = 20
  hash_key     = "LockID"
  attribute {
    name = "LockID"
    type = "S"
    }
}
terraform {
required_providers {
 aws = {
 source = "hashicorp/aws"
 version ="~>3.28"
}
}
}
provider aws {
    region = "ap-south-1"
}