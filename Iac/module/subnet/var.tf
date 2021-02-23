variable "vpc_id" {
    description = "The required VPC id for subnet creation"
}
variable "cidr_block" {
    description = "The required CIDR for Subnet" 
}
variable "tags" {
    description = "Tag Value for Subnets"
    type = map
}
variable "availability_zone" {
    description = "Availability zone for Subnet"
  
}
variable "map_public_ip_on_launch" {
    description = "For providing public ip on launch"
    default = false
  
}
