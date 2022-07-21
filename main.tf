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

# Create VPC
resource "aws_vpc" "kien-vpc" {
  cidr_block       = var.cidr.vpc_block
  instance_tenancy = "default"

  tags = {
    Name        = var.tag_list.vpc_name
    GBL_CLASS_0 = var.tag_list.GBL_CLASS_0
    GBL_CLASS_1 = var.tag_list.GBL_CLASS_1
  }
}

#Create Subnet Public 1
resource "aws_subnet" "kien-pub-sub-1" {
  vpc_id     = aws_vpc.kien-vpc.id
  cidr_block = var.cidr.sub_pub1_block

  tags = {
    Name        = var.tag_list.sub_pub1_name
    GBL_CLASS_0 = var.tag_list.GBL_CLASS_0
    GBL_CLASS_1 = var.tag_list.GBL_CLASS_1
  }
}

#Create Subnet Public 2
resource "aws_subnet" "kien-pub-sub-2" {
  vpc_id     = aws_vpc.kien-vpc.id
  cidr_block = var.cidr.sub_pub2_block

  tags = {
    Name        = var.tag_list.sub_pub2_name
    GBL_CLASS_0 = var.tag_list.GBL_CLASS_0
    GBL_CLASS_1 = var.tag_list.GBL_CLASS_1
  }
}

#Create Subnet Private 1
resource "aws_subnet" "kien-pri-sub-1" {
  vpc_id     = aws_vpc.kien-vpc.id
  cidr_block = var.cidr.sub_pri1_block

  tags = {
    Name        = var.tag_list.sub_pri1_name
    GBL_CLASS_0 = var.tag_list.GBL_CLASS_0
    GBL_CLASS_1 = var.tag_list.GBL_CLASS_1
  }
}

#Create Subnet Private 2
resource "aws_subnet" "kien-pri-sub-2" {
  vpc_id     = aws_vpc.kien-vpc.id
  cidr_block = var.cidr.sub_pri2_block

  tags = {
    Name        = var.tag_list.sub_pri2_name
    GBL_CLASS_0 = var.tag_list.GBL_CLASS_0
    GBL_CLASS_1 = var.tag_list.GBL_CLASS_1
  }
}

#Create Subnet DB 1
resource "aws_subnet" "kien-db-sub-1" {
  vpc_id     = aws_vpc.kien-vpc.id
  cidr_block = var.cidr.sub_db1_block

  tags = {
    Name        = var.tag_list.sub_db1_name
    GBL_CLASS_0 = var.tag_list.GBL_CLASS_0
    GBL_CLASS_1 = var.tag_list.GBL_CLASS_1
  }
}

#Create Subnet DB 2
resource "aws_subnet" "kien-db-sub-2" {
  vpc_id     = aws_vpc.kien-vpc.id
  cidr_block = var.cidr.sub_db2_block

  tags = {
    Name        = var.tag_list.sub_db2_name
    GBL_CLASS_0 = var.tag_list.GBL_CLASS_0
    GBL_CLASS_1 = var.tag_list.GBL_CLASS_1
  }
}

#Create Internet Gateway
resource "aws_internet_gateway" "kien-igw" {
  vpc_id = aws_vpc.kien-vpc.id

  tags = {
    Name        = var.tag_list.igw_name
    GBL_CLASS_0 = var.tag_list.GBL_CLASS_0
    GBL_CLASS_1 = var.tag_list.GBL_CLASS_1
  }
}

#Create Nat Gateway in Public Subnet
resource "aws_nat_gateway" "kien-ngw" {
  subnet_id = aws_subnet.kien-pub-sub-1.id

  tags = {
    Name        = var.tag_list.ngw_name
    GBL_CLASS_0 = var.tag_list.GBL_CLASS_0
    GBL_CLASS_1 = var.tag_list.GBL_CLASS_1
  }
}

#Create RouteTable Public with Internet Gateway
resource "aws_route_table" "kien-rt-public" {
  vpc_id = aws_vpc.kien-vpc.id

  route {
    cidr_block = var.cidr.all_block
    gateway_id = aws_internet_gateway.kien-igw.id
  }

  tags = {
    Name        = var.tag_list.rt_pub_name
    GBL_CLASS_0 = var.tag_list.GBL_CLASS_0
    GBL_CLASS_1 = var.tag_list.GBL_CLASS_1
  }
}

resource "aws_route_table_association" "kien-rta-pub-1" {
  subnet_id      = aws_subnet.kien-pub-sub-1.id
  route_table_id = aws_route_table.kien-rt-public.id
}

resource "aws_route_table_association" "kien-rta-pub-2" {
  subnet_id      = aws_subnet.kien-pub-sub-2.id
  route_table_id = aws_route_table.kien-rt-public.id
}

#Create RouteTable Private with Nat Gateway
resource "aws_route_table" "kien-rt-private" {
  vpc_id = aws_vpc.kien-vpc.id

  route {
    cidr_block = var.cidr.all_block
    gateway_id = aws_nat_gateway.kien-ngw.id
  }

  tags = {
    Name        = var.tag_list.rt_pri_name
    GBL_CLASS_0 = var.tag_list.GBL_CLASS_0
    GBL_CLASS_1 = var.tag_list.GBL_CLASS_1
  }
}

resource "aws_route_table_association" "kien-rta-pri-1" {
  subnet_id      = aws_subnet.kien-pri-sub-1.id
  route_table_id = aws_route_table.kien-rt-private.id
}

resource "aws_route_table_association" "kien-rta-pri-2" {
  subnet_id      = aws_subnet.kien-pri-sub-2.id
  route_table_id = aws_route_table.kien-rt-private.id
}

#Create RouTable DB
resource "aws_route_table" "kien-rt-database" {
  vpc_id = aws_vpc.kien-vpc.id

  tags = {
    Name        = "value"
    GBL_CLASS_0 = var.tag_list.GBL_CLASS_0
    GBL_CLASS_1 = var.tag_list.GBL_CLASS_1
  }
}

resource "aws_route_table_association" "kien-rta-db-1" {
  subnet_id      = aws_subnet.kien-db-sub-1.id
  route_table_id = aws_route_table.kien-rt-database.id
}

resource "aws_route_table_association" "kien-rta-db-2" {
  subnet_id      = aws_subnet.kien-db-sub-2.id
  route_table_id = aws_route_table.kien-rt-database.id
}
