resource "aws_instance" "mdev" {
 ami = "ami-02d7fd1c2af6eead0"
 instance_type = "t2.micro"
 subnet_id = data.aws_subnet.dev.id
 security_groups = [data.aws_security_group.allow_tls.id]
 tags = {
     Name = "dev-ec2"
  }
  
}