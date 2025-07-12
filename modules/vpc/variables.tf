###___VPC_______
variable "vpc_cidr" {
  type    = string
  default = "10.0.0.0/16"
}

variable "vpc_instance_tenancy" {
  type = string
  default = "default"
}

###____Subnets______
variable "sub_cidr" {
  type    = list(string)
  default = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
}

variable "resource_name" {
  type = string
  default = "my-project"
}

variable "subnets_map_public_ip_on_launch" {
  type = bool
  default = true
}

###__Route_Table__
variable "rt-route" {
    type = string
    default = "0.0.0.0/0"
  
}

###___Common_Tags_____
variable "common_tags" {
  type        = map(string)
}
