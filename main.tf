terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

provider "aws" {
  region = "ap-northeast-1"
}

#Create VPC
resource "aws_vpc" "kien-vpc" {
  cidr_block       = var.cidr_block.vpc
  instance_tenancy = "default"
  tags = {
    Name        = var.tags.vpc
    GBL_CLASS_0 = var.tags.GBL_CLASS_0
    GBL_CLASS_1 = var.tags.GBL_CLASS_1
  }
}

#Create Public, Private, Database Subnets
resource "aws_subnet" "kien-pub-sub-1" {
  vpc_id            = aws_vpc.kien-vpc.id
  cidr_block        = var.cidr_block.sub_pub_1
  availability_zone = var.availability_zone.ap_northeast_1a
  tags = {
    Name        = var.tags.sub_pub_1
    GBL_CLASS_0 = var.tags.GBL_CLASS_0
    GBL_CLASS_1 = var.tags.GBL_CLASS_1
  }
}

resource "aws_subnet" "kien-pub-sub-2" {
  vpc_id            = aws_vpc.kien-vpc.id
  cidr_block        = var.cidr_block.sub_pub_2
  availability_zone = var.availability_zone.ap_northeast_1b

  tags = {
    Name        = var.tags.sub_pub_2
    GBL_CLASS_0 = var.tags.GBL_CLASS_0
    GBL_CLASS_1 = var.tags.GBL_CLASS_1
  }
}

resource "aws_subnet" "kien-pri-sub-1" {
  vpc_id            = aws_vpc.kien-vpc.id
  cidr_block        = var.cidr_block.sub_pri_1
  availability_zone = var.availability_zone.ap_northeast_1a
  tags = {
    Name        = var.tags.sub_pri_1
    GBL_CLASS_0 = var.tags.GBL_CLASS_0
    GBL_CLASS_1 = var.tags.GBL_CLASS_1
  }
}

resource "aws_subnet" "kien-pri-sub-2" {
  vpc_id            = aws_vpc.kien-vpc.id
  cidr_block        = var.cidr_block.sub_pri_2
  availability_zone = var.availability_zone.ap_northeast_1b
  tags = {
    Name        = var.tags.sub_pri_2
    GBL_CLASS_0 = var.tags.GBL_CLASS_0
    GBL_CLASS_1 = var.tags.GBL_CLASS_1
  }
}

resource "aws_subnet" "kien-db-sub-1" {
  vpc_id            = aws_vpc.kien-vpc.id
  cidr_block        = var.cidr_block.sub_db_1
  availability_zone = var.availability_zone.ap_northeast_1a
  tags = {
    Name        = var.tags.sub_db_1
    GBL_CLASS_0 = var.tags.GBL_CLASS_0
    GBL_CLASS_1 = var.tags.GBL_CLASS_1
  }
}

resource "aws_subnet" "kien-db-sub-2" {
  vpc_id            = aws_vpc.kien-vpc.id
  cidr_block        = var.cidr_block.sub_db_2
  availability_zone = var.availability_zone.ap_northeast_1b
  tags = {
    Name        = var.tags.sub_db_2
    GBL_CLASS_0 = var.tags.GBL_CLASS_0
    GBL_CLASS_1 = var.tags.GBL_CLASS_1
  }
}

#Create Internet Gateway
resource "aws_internet_gateway" "kien-igw" {
  vpc_id = aws_vpc.kien-vpc.id
  tags = {
    Name        = var.tags.igw
    GBL_CLASS_0 = var.tags.GBL_CLASS_0
    GBL_CLASS_1 = var.tags.GBL_CLASS_1
  }
}

#Create Nat Gateway
resource "aws_nat_gateway" "kien-ngw" {
  vpc_id    = aws_vpc.kien-vpc.id
  subnet_id = aws_subnet.kien-pub-sub-1
  tags = {
    Name        = var.tags.ngw
    GBL_CLASS_0 = var.tags.GBL_CLASS_0
    GBL_CLASS_1 = var.tags.GBL_CLASS_1
  }
}

#Create Public, Private, Database Route Tables
resource "aws_route_table" "kien-pub-rt" {
  vpc_id = aws_vpc.kien-vpc.id

  route = {
    cidr_block = var.cidr_block.pub_rt
    gateway_id = aws_internet_gateway.kien-igw.id
  }
  tags = {
    Name        = var.tags.pub_rt
    GBL_CLASS_0 = var.tags.GBL_CLASS_0
    GBL_CLASS_1 = var.tags.GBL_CLASS_1
  }
}

resource "aws_route_table" "kien-pri-rt" {
  vpc_id = aws_vpc.kien-vpc.id

  route = {
    cidr_block     = var.cidr_block.pri_rt
    nat_gateway_id = aws_internet_gateway.kien-ngw.id
  }

  tags = {
    Name        = var.tags.pri_rt
    GBL_CLASS_0 = var.tags.GBL_CLASS_0
    GBL_CLASS_1 = var.tags.GBL_CLASS_1
  }
}

resource "aws_route_table" "kien-db-rt" {
  vpc_id = aws_vpc.kien-vpc.id

  route = {}

  tags = {
    Name        = var.tags.db_rt
    GBL_CLASS_0 = var.tags.GBL_CLASS_0
    GBL_CLASS_1 = var.tags.GBL_CLASS_1
  }
}


#Create Subnets Route Tables Association
resource "aws_route_table_association" "kien-pub-sub-1-rt" {
  subnet_id      = aws_subnet.kien-pub-sub-1.id
  route_table_id = aws_route_table.kien-pub-rt.id
}

resource "aws_route_table_association" "kien-pub-sub-2-rt" {
  subnet_id      = aws_subnet.kien-pub-sub-2.id
  route_table_id = aws_route_table.kien-pub-rt.id
}

resource "aws_route_table_association" "kien-pri-sub-1-rt" {
  subnet_id      = aws_subnet.kien-pri-sub-1.id
  route_table_id = aws_route_table.kien-pri-rt.id
}

resource "aws_route_table_association" "kien-pri-sub-2-rt" {
  subnet_id      = aws_subnet.kien-pri-sub-2.id
  route_table_id = aws_route_table.kien-pri-rt.id
}

resource "aws_route_table_association" "kien-db-sub-1-rt" {
  subnet_id      = aws_subnet.kien-db-sub-1.id
  route_table_id = aws_route_table.kien-db-rt.id
}

resource "aws_route_table_association" "kien-db-sub-2-rt" {
  subnet_id      = aws_subnet.kien-db-sub-2.id
  route_table_id = aws_route_table.kien-db-rt.id
}
