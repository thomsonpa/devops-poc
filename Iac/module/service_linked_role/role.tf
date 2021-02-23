resource "aws_iam_service_linked_role" "role" {
  aws_service_name = var.service_name
}