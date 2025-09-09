data "aws_availability_zones" "available" {
  state = "available"
}

output "AZS" {
    value = data.aws_availability_zones.available
}
data "aws_vpc" "default" {
    default = "true"
}