variable "vpc_cidr" {
  type    = string
  default = "10.0.0.0/16"
}

variable "sub_cidr" {
  type    = list(string)
  default = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
}

variable "resource_name" {
  type = string
  default = "my-project"
}

variable "rt-route" {
    type = string
    default = "0.0.0.0/0"
  
}