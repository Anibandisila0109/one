resource "aws_instance" "ec2" {
    ami = "ami-02d7fd1c2af6eead0"
    instance_type = "t2.micro"
    key_name = "linux"
    tags = {
      Name = "terraform"
    }
}