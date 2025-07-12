#####__Launche Template Variables

variable "resource_name" {
  type    = string
  default = "my-project"
}

variable "instance_type" {
  type    = string
  default = "t2.micro"
}

variable "key_name" {
  type = string
}

variable "lt_tags" {
  type = map(string)
  default = {
    name = "production"
  }
}

variable "my_template_type" {
  type    = string
  default = "instance"
}


####_____ASG___Variables

variable "asg_min_size" {
  type    = number
  default = 2
}
variable "asg_max_size" {
  type    = number
  default = 5
}
variable "asg_desired_capacity" {
  type    = number
  default = 2
}

variable "asg_health_check_type" {
  type    = string
  default = "ELB"
}

variable "health_check_grace_period" {
  type    = number
  default = "300"
}

variable "asg_launch_template_version" {
  type    = string
  default = "$Latest"
}

variable "asg_tag_key" {
  type    = string
  default = "Name"
}

variable "asg_tag_propagate_at_launch" {
  type    = bool
  default = true
}

variable "asg_lifecycle_create_before_destroy" {
  type    = bool
  default = true
}

###___Common_Tags_____
variable "common_tags" {
  type = map(string)
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
  type = string
}



