module "vpc" {
    source = "/home/tonoyan/terraform/test/my-project/modules/vpc"
}

####______Security-Group________

resource "aws_security_group" "my-sg" {
  name        = "${var.resource_name}-SG"
  vpc_id      = var.vpc_id

}

#####_____Security-Group-Ingress-Rulles____
resource "aws_security_group_rule" "my-sg-ingress" {
     for_each = var.my_sg_ingress

  type              = "ingress"
  from_port         = each.value.from_port
  to_port           = each.value.to_port
  protocol          = each.value.protocol
  cidr_blocks       = each.value.cidr_blocks
  security_group_id = aws_security_group.my-sg.id
}

#####_____Security-Group-Egress-Rulles____

resource "aws_security_group_rule" "my-sg-egress" {
  for_each = var.my-sg-egress

  type              = "egress"
  from_port         = each.value.from_port
  to_port           = each.value.to_port
  protocol          = each.value.protocol
  cidr_blocks       = each.value.cidr_blocks
  security_group_id = aws_security_group.my-sg.id
}
