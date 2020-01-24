resource "aws_internet_gateway" "example-env-gw" {
    vpc_id = aws_vpc.example-env.id

    tags = {
        Name = "example-env-gw"
    }
}
