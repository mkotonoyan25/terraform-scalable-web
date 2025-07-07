output "vpc" {
  value = aws_vpc.vpc.id
}

output "pub_subnets" {
  value = [for i in aws_subnet.subnets : i.id]
}