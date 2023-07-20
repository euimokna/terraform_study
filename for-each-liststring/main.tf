resource "aws_vpc" "main" {
  cidr_block = var.vpc_cidr

  tags = {
    Name = "terraform VPC"
  }
}

resource "aws_subnet" "public" {
  for_each = toset(var.public_subnet_cidrs) #list string type이기 때문에 for_each에서는 toset을 통한 자료형변환필요
#   for_each = var.public_subnet_cidrs
  vpc_id     = aws_vpc.main.id
  cidr_block = each.key
}
