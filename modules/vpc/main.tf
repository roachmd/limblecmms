terraform {
  required_version = ">= 1.0.0"
}

provider "aws" {
  region = var.aws_region
}

resource "aws_vpc" "this" {
  cidr_block = var.cidr_block

  tags = {
    Name = "${var.environment}-vpc"
  }
}

resource "aws_subnet" "public" {
  count = var.subnet_count

  vpc_id            = aws_vpc.this.id
  cidr_block        = cidrsubnet(var.cidr_block, 8, count.index)
  availability_zone = element(var.availability_zones, count.index)

  tags = {
    Name = "${var.environment}-public-subnet-${count.index}"
  }
}

