
#####____Launche_Template_____
resource "aws_launch_template" "my_template" {
  name_prefix   = "${var.resource_name}-lt-"
  image_id      = data.aws_ami.ubuntu.id
  instance_type = var.instance_type
  key_name      = var.key_name

  vpc_security_group_ids = [var.my_sg_id]

  user_data = filebase64("${path.module}/user_data.sh")


  tag_specifications {
    resource_type = var.my_template_type

    tags = var.common_tags
  }
}

####____Auto_Scaling_Group_____

resource "aws_autoscaling_group" "asg" {
  name_prefix      = "${var.resource_name}-asg-"
  min_size         = var.asg_min_size
  max_size         = var.asg_max_size
  desired_capacity = var.asg_desired_capacity

  vpc_zone_identifier = var.vpc_pub_subnets

  health_check_type         = var.asg_health_check_type
  health_check_grace_period = var.asg.health_check_grace_period

  target_group_arns = [var.target_group_arn]

  launch_template {
    id      = aws_launch_template.my_template.id
    version = var.asg_launch_template_version
  }

  tag {
    key                 = var.asg_tag_key
    value               = "${var.resource_name}-instance"
    propagate_at_launch = var.asg_tag_propagate_at_launch
  }

  lifecycle {
    create_before_destroy = var.asg_lifecycle_create_before_destroy
  }
}
