variable "resource_name" {
  type    = string
  default = "my-project"
}

######___ALB_______

variable "internal" {
  type    = bool
  default = "false"
}

variable "load_balancer_type" {
  type    = string
  default = "application"
}

#######____Target---Group_____
variable "tg_port" {
  type    = string
  default = "80"
}

variable "tg_protocol" {
  type    = string
  default = "HTTP"
}

#__TG_Health_Check
variable "tg_health_check" {
  type = object({
    protocol            = string
    path                = string
    matcher             = string
    interval            = number
    timeout             = number
    healthy_threshold   = number
    unhealthy_threshold = number
  })

  default = {
    protocol            = "HTTP"
    path                = "/"
    matcher             = "200-399"
    interval            = 30
    timeout             = 5
    healthy_threshold   = 2
    unhealthy_threshold = 2
  }
}


######_______Listener___________
variable "listener_port" {
  type    = string
  default = "80"
}
variable "listener_protocol" {
  type    = string
  default = "HTTP"
}

variable "listener_type" {
  type    = string
  default = "forward"
}

###___Common_Tags_____
variable "common_tags" {
  type = map(string)
}

###___Modules_____
variable "vpc_pub_subnets" {
  type = list(string)
}
variable "vpc_id" {
  type = string
}

variable "my_sg_id" {
  type = string
}