
####______Security-Group________

resource "aws_security_group" "my_sg" {
  name        = var.sg_name
  vpc_id      = var.vpc_id
  tags = var.common_tags

}

#####_____Security-Group-Ingress-Rulles____
resource "aws_security_group_rule" "my_sg_ingress" {
     for_each = var.my_sg_ingress

  type              = "ingress"
  from_port         = each.value.from_port
  to_port           = each.value.to_port
  protocol          = each.value.protocol
  cidr_blocks       = each.value.cidr_blocks
  security_group_id = aws_security_group.my_sg.id
}

#####_____Security-Group-Egress-Rulles____

resource "aws_security_group_rule" "my_sg_egress" {
  for_each = var.my_sg_egress

  type              = "egress"
  from_port         = each.value.from_port
  to_port           = each.value.to_port
  protocol          = each.value.protocol
  cidr_blocks       = each.value.cidr_blocks
  security_group_id = aws_security_group.my_sg.id
}
