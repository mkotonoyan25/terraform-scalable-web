##__VPC_MODULE
variable "vpc_id" {
  description = "VPC ID to attach the security group to"
  type        = string
}
###___SG___
variable "sg_name" {
  type = string
  default = "my-sg"
}

#####_____SG-Ingress-Rulles____

variable "my_sg_ingress" {
  description = "Map of security group ingress rules"
  type = map(object(
    {
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = list(string)
  }
  )
  )

  default = {
    http = {
      from_port   = 80
      to_port     = 80
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    },
    https = {
      from_port   = 443
      to_port     = 443
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }
  }

  variable "my_sg_ingress_type" {
  type = string
  default = "ingress"
}

#####_____SG-Egress-Rulles____

  variable "my_sg_egress" {
  description = "Map of egress rules"
  type = map(object(
    {
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = list(string)
  }
  )
  )
  default = {
    all_outbound = {
      from_port   = 0
      to_port     = 0
      protocol    = "-1"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }
}

variable "my_sg_egress_type" {
  type = string
  default = "egress"
}

###___Common_Tags_____
variable "common_tags" {
  type        = map(string)
}


