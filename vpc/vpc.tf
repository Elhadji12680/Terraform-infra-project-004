resource "aws_vpc" "main_vpc"{
  cidr_block       = var.vpc_cidr_block
  instance_tenancy = "default"

  tags = merge(var.tags, {
  Name = "${var.tags["project"]}-${var.tags["application"]}-${var.tags["environment"]}-main-vpc"
})
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main_vpc.id

  tags =  merge(var.tags, {
  Name = "${var.tags["project"]}-${var.tags["application"]}-${var.tags["environment"]}-igw"
})
}

# CREATING PUBLIC SUBNETS---------------------------------------- --------------------------------------------------------------------------
resource "aws_subnet" "public_subnet_az_1a" {
  vpc_id     = aws_vpc.main_vpc.id
  cidr_block = var.subnet_cidr_block[0]
  availability_zone = var.availability_zone[0]

  tags =  merge(var.tags, {
  Name = "${var.tags["project"]}-${var.tags["application"]}-${var.tags["environment"]}-public-subnet-az-1a"
})
}

resource "aws_subnet" "public_subnet_az_1b" {
  vpc_id     = aws_vpc.main_vpc.id
  cidr_block = var.subnet_cidr_block[1]
  availability_zone = var.availability_zone[1]

  tags =  merge(var.tags, {
  Name = "${var.tags["project"]}-${var.tags["application"]}-${var.tags["environment"]}-public-subnet-az-1b"
})
}

resource "aws_subnet" "private_subnet_az_1a" {
  vpc_id     = aws_vpc.main_vpc.id
  cidr_block = var.subnet_cidr_block[2]
  availability_zone = var.availability_zone[0]

  tags =  merge(var.tags, {
  Name = "${var.tags["project"]}-${var.tags["application"]}-${var.tags["environment"]}-private-subnet-az-1a"
})
}

resource "aws_subnet" "private_subnet_az_1b" {
  vpc_id     = aws_vpc.main_vpc.id
  cidr_block = var.subnet_cidr_block[3]
  availability_zone = var.availability_zone[1]

  tags =  merge(var.tags, {
  Name = "${var.tags["project"]}-${var.tags["application"]}-${var.tags["environment"]}-private-subnet-az-1b"
})
}