resource "aws_instance" "test" {
    ami = "ami-02d7fd1c2af6eead0"
    instance_type = "t2.micro"
    key_name = "linux"
    subnet_id = aws_subnet.dev.id
    associate_public_ip_address = true
    security_groups = [aws_security_group.allow_tls.id]
    tags = {
        Name = "dec2"
    } 
}