variable "resource_name" {
  type = string
  default = "my-project"
}

######___ALB_______

variable "internal" {
    type = bool
    default = "false" 
}

variable "load_balancer_type" {
  type = string
  default = "application"
}

#######____Target---Group_____
variable "tg_port" {
    type = string
    default = "80"
}

variable "tg_protocol" {
  type = string
  default = "HTTP"
}


######_______Listener___________
variable "listener_port" {
  type = string
  default = "80"
}
variable "listener_protocol" {
  type = string
  default = "HTTP"
}
