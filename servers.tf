resource "aws_instance" "example-ec2-instance" {
    ami = var.ami_id
    instance_type = "t1.micro"
    key_name = aws_key_pair.default.key_name
    security_groups =  [aws_security_group.ingress_all_test.id]
    
    tags = { 
        Name = var.ami_name
    }

    subnet_id = aws_subnet.subnet-gon.id
}