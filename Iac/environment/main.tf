#Module for defining VPC

module "vpc" {
    source     = "../module/vpc"
    cidr_block = var.vpc_cidr_block
    tags       = var.vpc_tags 
}

#Module for Internet gateway for VPC
module "internet_gateway" {
    source = "../module/internet_gateway"
    vpc_id = module.vpc.vpc_id
    tags   = var.internet_gateway_tags
  
}


#Module for SUbnet provisioning
module "subnet_1" {
    source            = "../module/subnet"
    vpc_id            = module.vpc.vpc_id
    availability_zone = var.subnet_1_availability_zone
    cidr_block        = var.subnet_1_cidr_block
    map_public_ip_on_launch = true
    tags              = var.subnet_1_tags 
}

#Module for SUbnet provisioning
module "subnet_2" {
    source            = "../module/subnet"
    vpc_id            = module.vpc.vpc_id
    availability_zone = var.subnet_2_availability_zone
    cidr_block        = var.subnet_2_cidr_block
    tags              = var.subnet_2_tags 
}
#Module for NIC
module "network_interface"{
    source      = "../module/network_interface"
    subnet_id   = module.subnet_1.id
    description = var.description
}

module "elastic_ip" {
    source            = "../module/elastic_ip"
    network_interface = module.network_interface.id
}

#Module for Nat gateway
module "nat_gateway" {
    source        = "../module/nat_gateway"
    allocation_id = module.elastic_ip.id
    subnet_id     = module.subnet_1.id
    tags          = var.nat_gateway_tags
  
}

#Module for Public route table
module "pub_route_table" {
    source     = "../module/pub_route_table"
    vpc_id     = module.vpc.vpc_id
    cidr_block = var.pub_route_table_cidr_block
    gateway_id = module.internet_gateway.id
    tags       = var.pub_route_table_tags 
}
#Module for Route Table assosciation with pub subnet
module "pub_rt_assosciation" {
    source         = "../module/route_table_subnet_assosciation"
    subnet_id      = module.subnet_1.id
    route_table_id = module.pub_route_table.id
}

#Module for private route table
module "pvt_route_table" {
    source         = "../module/pvt_route_table"
    vpc_id         = module.vpc.vpc_id
    cidr_block     = var.pvt_route_table_cidr_block
    nat_gateway_id = module.nat_gateway.id
    tags           = var.pvt_route_table_tags 
}

#Module for Route Table assosciation with private subnet
module "pvt_rt_assosciation" {
    source         = "../module/route_table_subnet_assosciation"
    subnet_id      = module.subnet_2.id
    route_table_id = module.pvt_route_table.id
}

#Module for policy creation
module "policy" {
    source      = "../module/iam_policy"
    name        = var.policy_name
    description = var.policy_description
    policy      = data.template_file.iam_policy.rendered
}
#Module for IAM Role
module "iam_role" {
    source      = "../module/iam_role"
    name               = var.iam_role_name
    description        = var.iam_role_description
    assume_role_policy = data.template_file.iam_role.rendered
    tags               = var.iam_role_tags 
}
#Module for Instance Profile creation
module "instance_profile" {
    source = "../module/iam_instance_profile"
    name   = var.instance_profile_name
    role   = module.iam_role.name
}
#Module for IAM Role 2
module "iam_role_2" {
    source             = "../module/iam_role"
    name               = var.iam_role_2_name
    description        = var.iam_role_2_description
    assume_role_policy = data.template_file.iam_role.rendered
    tags               = var.iam_role_2_tags 
}

#Module for IAM Role policy Attachment
module "role_policy_attachement"{
    source     = "../module/iam_role_policy_attachment"
    role       = module.iam_role.name
    policy_arn = module.policy.arn
}

#Module for Security group for EC2
module "security_group" {
    source      = "./ec2_security_group"
    name        = var.security_group_name
    description = var.security_group_description
    vpc_id      =  module.vpc.vpc_id
    tags        = var.security_group_tags 
}
#Module for ECS Cluster
module "ecs" {
    source = "../module/ecs_cluster"
    name   = var.ecs_name
    tags   = var.ecs_tags
}

#module for instance creation\
module "ec2" {
    source               = "../module/ec2"
    ami                  = var.ec2_ami    
    instance_type        = var.ec2_instance_type
    key_name             = var.key_name
    montioring           = var.monitoring 
    iam_instance_profile = module.instance_profile.name
    security_groups      = [module.security_group.id]
    userdata             = data.template_file.user_data.template
    subnet_id            = module.subnet_2.id
    tags                 = var.ec2_tags 

}

#Module for ECS Task Definition
module "ecs_task_definition" {
    source                = "../module/ecs_task_definition"
    family                = var.ecs_task_definition_name
    container_definitions = data.template_file.ecs_task_definition.template
}


#Module for TCP Load balancer
module "network_load_balancer" {
    source              = "../module/network_load_balancer"
    name                = var.network_load_balancer_name
    internal            = var.network_load_balancer_internal 
    load_balancer_type  = var.network_load_balancer_load_balancer_type
    subnet_ids          = [module.subnet_1.id]
    deletion_protection = var.network_load_balancer_deletion_protection 
    tags                = var.network_load_balancer_tags 
}

#Module for Target group
module "target_group" {
    source    = "../module/target_group"
    name      = var.target_group_name
    port      = var.target_group_port
    protocol  = var.target_group_protocol
    vpc_id    = module.vpc.vpc_id
    tags      = var.target_group_tags 
}

#Module for Listener
module "listener_2" {
    source            = "../module/load_balancer_listener"
    load_balancer_arn = module.network_load_balancer.arn
    port              = var.listener_2_port
    protocol          = var.listener_2_protocol
    type              = var.listener_2_type
    target_group_arn  = module.target_group.arn
}

#Module for ECS policy creation
module "ecs_policy" {
    source      = "../module/iam_policy"
    name        = var.ecs_policy_name
    description = var.ecs_policy_description
    policy      = data.template_file.ecs_policy.rendered
}

#Module for ECS IAM Role
module "ecs_role" {
    source             = "../module/iam_role"
    name               = var.ecs_role_name
    description        = var.ecs_role_description
    assume_role_policy = data.template_file.ecs_role.rendered
    tags               = var.ecs_role_tags
}

#Module for ECS Role policy Attachment
module "ecs_role_policy_attachement"{
    source     = "../module/iam_role_policy_attachment"
    role       = module.ecs_role.name
    policy_arn = module.ecs_policy.arn
}

#Module for ECS Service
module "ecs_service" {
    source                              = "../module/ecs_service"
    name                                = var.ecs_service_name
    launch_type                         = var.ecs_service_launch_type
    scheduling_strategy                 = var.ecs_service_scheduling_strategy
    deployment_maximum_percent          = var.ecs_service_deployment_maximum_percent
    deployment_minimum_healthy_percent  = var.ecs_service_deployment_minimum_healthy_percent
    cluster                             = module.ecs.id
    task_definition                     = module.ecs_task_definition.arn
    desired_count                       = var.ecs_service_desired_count
    iam_role                            = module.ecs_role.arn
    target_group_arn                    = module.target_group.arn
    container_name                      = var.ecs_service_container_name
    container_port                      = var.ecs_service_container_port
}
