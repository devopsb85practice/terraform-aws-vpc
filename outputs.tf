output "vpc_id" {
    value = aws_vpc.main.id
  
}
output "public_subnet_ids" {
    value = aws_subnet.public[*].id
  
}
output "privte_subnet_ids" {
    value = aws_subnet.private[*].id
  
}
output "database_subnet_ids" {
    value = aws_subnet.databse[*].id
  
}