#Variable declaration for VPC Module
variable vpc_cidr_block {}
variable "vpc_tags" {}

#Variable declaration for Internet gateway
variable internet_gateway_tags {}

#Variable declaration for Subnet module 
variable "subnet_1_availability_zone" {}
variable "subnet_1_cidr_block" {}
variable "subnet_1_tags" {}

#Variable declaration for Subnet module 
variable "subnet_2_availability_zone" {}
variable "subnet_2_cidr_block" {}
variable "subnet_2_tags" {}

#Variable declaration for NIC module
variable "description" {}

#Variable declaration for Nat gateway
variable nat_gateway_tags {}

#Variable declaration for public route table
variable pub_route_table_cidr_block {}
variable pub_route_table_tags {}

#Variable declaration for private route table
variable pvt_route_table_cidr_block {}
variable pvt_route_table_tags {}

#Variable declaration for IAM policy
variable policy_name {}
variable policy_description {}

#Variable declaration for IAM Role
variable iam_role_description {}
variable iam_role_name {}
variable iam_role_tags {}

#Variable declaration for Instance profile
variable instance_profile_name {}

#Variable declaration for IAM Role
variable iam_role_2_description {}
variable iam_role_2_name {}
variable iam_role_2_tags {}

#Variable declaration for Security group
variable security_group_name {}
variable security_group_description {}
variable security_group_tags {}

#Variable declaration for ECS Cluster
variable ecs_name {}
variable ecs_tags {}

#Variable declaration for EC2
variable ec2_ami {}
variable ec2_instance_type {}
variable key_name {}
variable monitoring {}
variable ec2_tags {}

#Variable declaration for ecs task definition
variable ecs_task_definition_name {}

#Variable declaration for NLB 
variable network_load_balancer_name {}
variable network_load_balancer_internal {}
variable network_load_balancer_load_balancer_type {}
variable network_load_balancer_deletion_protection {}
variable network_load_balancer_tags {}

#Variable Declaration for Target group
variable target_group_name {}
variable target_group_port {}
variable target_group_protocol {}
variable target_group_tags {}

#Variable for Listener
variable listener_port {}
variable listener_protocol {}
variable listener_type {}

#Variable for Listener
variable listener_2_port {}
variable listener_2_protocol {}
variable listener_2_type {}

#Variable for ECS Policy
variable ecs_policy_name {}
variable ecs_policy_description {}

#Variable for ECS Role
variable ecs_role_name {}
variable ecs_role_description {}
variable ecs_role_tags {}

#Variable for ECS Service
variable ecs_service_name {}
variable ecs_service_launch_type {}
variable ecs_service_scheduling_strategy {}
variable ecs_service_deployment_maximum_percent {}
variable ecs_service_deployment_minimum_healthy_percent {}
variable ecs_service_desired_count {}
variable ecs_service_container_name {}
variable ecs_service_container_port {}