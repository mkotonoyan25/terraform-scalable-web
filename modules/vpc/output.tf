output "vpc-id" {
  value = aws_vpc.vpc.id
}

output "pub-subnets" {
  value = [for i in aws_subnet.subnets : i.id]
}