output "vpc_id" {
    value = aws_vpc.main.id
  
}
output "Public_subnet_ids" {
    value = aws_vpc.public[*].id
  
}