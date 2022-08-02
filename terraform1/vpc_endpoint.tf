resource "aws_vpc_endpoint" "kien-vpc-endpoint" {
  vpc_id       = aws_vpc.kien-vpc.id
  service_name = "com.amazonaws.ap-northeast-1.s3"

  tags = {
    Name        = "${var.name}-vpc-endpoint"
    GBL_CLASS_0 = "${var.GBL_CLASS_0}"
    GBL_CLASS_1 = "${var.GBL_CLASS_1}"
  }
}

resource "aws_vpc_endpoint_route_table_association" "kien-vpc-endpoint-route-table-association" {
  route_table_id  = aws_route_table.kien-rt-public.id
  vpc_endpoint_id = aws_vpc_endpoint.kien-vpc-endpoint.id
}
