
#####____Launche_Template_____
resource "aws_launch_template" "my_template" {
  name_prefix   = "${var.resource_name}-lt-"
  image_id      = var.image_id
  instance_type = var.instance_type
  key_name      = var.key_name

  vpc_security_group_ids = [var.my_sg_id]

  user_data = filebase64("${path.module}/user_data.sh")


  tag_specifications {
    resource_type = "instance"

    tags = var.common_tags
  }

}

####____Auto_Scaling_Group_____

resource "aws_autoscaling_group" "asg" {
  name_prefix               = "${var.resource_name}-asg-"
  min_size                  = var.asg_min_size
  max_size                  = var.asg_max_size
  desired_capacity          = var.asg_desired_capacity

  vpc_zone_identifier       = var.vpc_pub_subnets

  health_check_type         = "ELB"                          
  health_check_grace_period = 300

  target_group_arns         = [var.target_group_arn] 

  launch_template {
    id      = aws_launch_template.my_template.id
    version = "$Latest"
  }

  tag {
    key                 = "Name"
    value               = "${var.resource_name}-instance"
    propagate_at_launch = true
  }

  lifecycle {
    create_before_destroy = true
  }
}
