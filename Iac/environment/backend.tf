terraform {
  backend "s3" {
    bucket          = "terraform-state-test-growth"
    dynamodb_table  = "terraform-state-lock"
    key             = "state.tfstate"
    region          = "ap-south-1"
  }
}