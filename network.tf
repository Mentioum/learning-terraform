resource "aws_vpc" "example-env" {
    cidr_block = "10.0.0.0/16"
    enable_dns_hostnames = true
    enable_dns_support = true
    tags = {
        Name = "example-env"
    }
}

resource "aws_eip" "ip" {
    vpc = true
    instance = aws_instance.example-ec2-instance.id
}