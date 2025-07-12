module "vpc" {
  source       = "../../modules/vpc"
  common_tags  = var.common_tags
  # other vars...
}

module "security_group" {
  source       = "../../modules/security-group/"
    common_tags  = var.common_tags
    vpc_id       = module.vpc.vpc
}

module "alb" {
  source       = "../../modules/alb"
    common_tags  = var.common_tags
    vpc_id = module.vpc.vpc
    my_sg_id = module.security_group.my_sg_id
    vpc_pub_subnets = module.vpc.pub_subnets

}

module "ec2" {
  source       = "../../modules/ec2"
  common_tags  = var.common_tags
  key_name = var.key_name
  vpc_id = module.vpc.vpc
  my_sg_id = module.security_group.my_sg_id
  vpc_pub_subnets = module.vpc.pub_subnets
  target_group_arn = module.alb.target_group_arn
}

