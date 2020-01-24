resource "aws_subnet" "subnet-gon" {
    cidr_block = cidrsubnet(aws_vpc.example-env.cidr_block,3,1)
    vpc_id = aws_vpc.example-env.id
    availability_zone = "eu-west-1a"
}

resource "aws_route_table" "route_table_example_env" {
    vpc_id = aws_vpc.example-env.id
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.example-env-gw.id
    }
    tags = {
        Name = "example-env-route-table"
    }
}
resource "aws_route_table_association" "subnet-association" {
    subnet_id = aws_subnet.subnet-gon.id
    route_table_id = aws_route_table.route_table_example_env.id
}