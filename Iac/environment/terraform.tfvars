#Providing values for VPC Module
vpc_cidr_block = "10.0.0.0/16"
vpc_tags       = {
        Name = "vpc-01"
        Environment = "POC"
    }

#Providing values for Internet gateway
internet_gateway_tags = { 
    Name       = "igw-1"
    Environment = "POC"
}

#Providing the values for Subnet 1 variables
subnet_1_availability_zone = "ap-south-1a"
subnet_1_cidr_block        = "10.0.0.0/17"
subnet_1_tags   = {
    Name       = "subnet-1"
    Environment = "POC"
    }

#Providing the values for Subnet 2 variables
subnet_2_availability_zone = "ap-south-1a"
subnet_2_cidr_block        = "10.0.128.0/17"
subnet_2_tags   = {
    Name        = "subnet-2"
    Environment = "POC"
    }

#Providing values for NIC variables
description = "Interface for NAT Gateway nat-03e1bf06f01aafbc1"

#Providing values for NAT Gateway
nat_gateway_tags = {
        Environment = "POC"
        Name        = "nat-01"
    }

#Providing values for Public route table
pub_route_table_cidr_block = "0.0.0.0/0"
pub_route_table_tags       = {
        Name               = "pub-route-1"
        Environment        = "POC"
    }

#Providing values for Prviate route table
pvt_route_table_cidr_block = "0.0.0.0/0"
pvt_route_table_tags       = {
        Name               = "pvt-route-01"
        Environment        = "POC"
    }

#Providing values for IAM Policy 
policy_name        = "ec2-ecs-policy"
policy_description = "Policy to be assosciated for ecs -ec2 role"

#Providing values for IAM Role
iam_role_name        = "ec2-ecs-role"
iam_role_description = "Role to grant permission for EC2"
iam_role_tags        = {
        Name        = "ec2-ecs-role"
        Environment = "POC"
    }

#Providing values for Instance profile
instance_profile_name = "ec2-instance-profile"

#Providing values for IAM role 2
iam_role_2_description = "Role to grant permission for EC2"
iam_role_2_name        = "ecs-ec2-role"
iam_role_2_tags        = {
        Name = "ecs-ec2-role"
        Environment = "POC"
    }

#Providing values for Security group
security_group_name         = "ec2-sg-01"
security_group_description  = "Security group for EC2"
security_group_tags         = {
        Name        = "ec2-sg-01"
        Environment = "POC"
    }

#Providing values for ECS Cluster name 
ecs_name   = "ecs-01"
ecs_tags   = {
        Name        = "ecs-01"
        Environment = "POC"
    }

#Providing values for Ec2 
ec2_ami            = "ami-070ea05cb21034fd4"
ec2_instance_type  = "t2.micro"
key_name           = "test"
monitoring         = true
ec2_tags           = {
        Name        = "EC2-01"
        Environment = "POC"
    }

#Providing values for ECS Task definition
ecs_task_definition_name = "redis"

#Providing values for NLB
network_load_balancer_name                = "external-nlb-01"
network_load_balancer_internal            = false
network_load_balancer_load_balancer_type  = "network"
network_load_balancer_deletion_protection = true
network_load_balancer_tags                = {
        Name        = "external-nlb-01"
        Environment = "POC"
    }

#Providing values for Target group
target_group_name      = "target-grp-01"
target_group_port      = "80"
target_group_protocol  = "TCP"
target_group_tags      = {
        Name = "target-grp-01"
        Environment = "POC"
    }

#Providing values for listener
listener_port      = "80"
listener_protocol  = "TCP"
listener_type      = "forward"

#Providing values for listener
listener_2_port      = "6379"
listener_2_protocol  = "TCP"
listener_2_type      = "forward"

#Providing values for ECS Policy
ecs_policy_name        = "ecs-policy"
ecs_policy_description = "Policy to be assosciated for ecs service role"

#Providing values for ecs role
ecs_role_name         = "ecs-role"
ecs_role_description  = "Role to grant permission for ECS"
ecs_role_tags         = {
        Name          = "ecs-role"
        Environment   = "POC"
    }

#Providing values for ECS Service
ecs_service_name                               = "redis-service-01"
ecs_service_launch_type                        = "EC2"
ecs_service_scheduling_strategy                = "REPLICA"
ecs_service_deployment_maximum_percent         = "200"
ecs_service_deployment_minimum_healthy_percent = "100"
ecs_service_desired_count                      = "1"
ecs_service_container_name                     = "redis"
ecs_service_container_port                     = "6379"