#roboshop-dev/prod

resource "aws_vpc" "main" {
  cidr_block       = var.cidr_block
  instance_tenancy = "default"
  enable_dns_hostnames = "true"

  tags = merge(
    local.common_tags,
    {
        Name = "${var.project}-${var.environment}"
    }
  )
}

resource "aws_internet_gateway" "main" {
  vpc_id = aws_vpc.main.id  #attatch the VPC

  tags = merge(
    local.common_tags,
    {
        Name = "${var.project}-${var.environment}"
    }
  )
}

#roboshop-dev-us-est-1a
resource "aws_subnet" "main" {
    count = length(var.public_subnet_cidrs)
    vpc_id     = aws_vpc.main.id
    cidr_block = var.public_subnet_cidrs[count.index]
    availability_zone = slice(data.aws_availability_zones.available.names, 0, 2)[count.index]
     map_public_ip_on_launch = true

  tags = {
    Name = "Main"
  }
}