#####__Launche Template Variables

variable "resource_name" {
  type    = string
  default = "my-project"
}

variable "image_id" {
  type    = string
  default = "ami-02003f9f0fde924ea"
}

variable "instance_type" {
  type    = string
  default = "t2.micro"
}

variable "key_name" {
  type = string
}

variable "lt_tags" {
  type    = map(string)
  default = {
    name = "production"
  }
  }

####_____ASG___Variables

variable "asg_min_size" {
  type = number
  default = 2
}
variable "asg_max_size" {
  type = number
  default = 5
}
variable "asg_desired_capacity" {
  type = number
  default = 2
}

###___Common_Tags_____
variable "common_tags" {
  type        = map(string)
}

###___Modules___

variable "vpc_id" {
  description = "VPC ID to attach the security group to"
  type        = string
}

variable "my_sg_id" {
  description = "Security Group ID to attach to instances"
  type        = string
}

variable "vpc_pub_subnets" {
  description = "List of public subnet IDs for the Auto Scaling Group"
  type        = list(string)
}


variable "target_group_arn" {
  type        = string
}



