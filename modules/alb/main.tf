
variable "vpc_pub_subnets" {
  type = list(string)
}
variable "vpc_id" {
  type = string
}

variable "my_sg_id" {
  type = string
}

####---Creating___ALB____Resource
resource "aws_lb" "alb" {
  name               = "${var.resource_name}-ALB"
  internal           = var.internal
  load_balancer_type = var.load_balancer_type
  security_groups    = [var.my_sg_id]
  subnets            = var.vpc_pub_subnets

  tags = var.common_tags
  
}

####---Creating___Target_Group
resource "aws_lb_target_group" "app_tg" {
  name     = "${var.resource_name}-TG"
  port     = var.tg_port
  protocol = var.tg_protocol
  vpc_id   = var.vpc_id

  health_check {
    protocol            = var.tg_hc_protocol
    path                = "/"
    matcher             = "200-399"
    interval            = 30
    timeout             = 5
    healthy_threshold   = 2
    unhealthy_threshold = 2
  }

  tags = var.common_tags
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

  tags = var.common_tags
}

