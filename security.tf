resource "aws_security_group" "ingress_all_test" {
    name = "allow-all-sg"
    vpc_id = aws_vpc.example-env.id

    ingress {
        cidr_blocks = [
            "0.0.0.0/0"
        ]
        from_port = 22
        to_port = 22
        protocol = "tcp"
    }

    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
}

resource "aws_key_pair" "default" {
    key_name= "defaultkey"
    public_key = file("~/.ssh/id_rsa.pub")
}