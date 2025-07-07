
variable "resource_name" {
  type = string
  default = "my-project"
}

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

variable "vpc_id" {
  type = string
  default = "module.vpc.vpc-id"
}


