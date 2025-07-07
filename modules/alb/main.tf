####---__SG___Module
module "security-group" {
  source = "../security-group"
}

####---_VPC___Module
module "vpc" {
  source = "../vpc"
}

####---Creating___ALB____Resource
resource "aws_lb" "alb" {
  name               = "${var.resource_name}-ALB"
  internal           = var.internal
  load_balancer_type = var.load_balancer_type
  security_groups    = [module.security-group.my_sg_id]
  subnets            = module.vpc.pub_subnets

  enable_deletion_protection = true
  
}

####---Creating___Target_Group
resource "aws_lb_target_group" "app_tg" {
  name     = "${var.resource_name}-TG"
  port     = var.tg_port
  protocol = var.tg_protocol
  vpc_id   = module.vpc.vpc
}

####___________ALB---Listener_____

resource "aws_lb_listener" "listener" {
  load_balancer_arn = aws_lb.alb.arn
  port              = var.listener_port
  protocol          = var.listener_protocol
 
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.app_tg.arn
  }
}

