resource "aws_instance" "web" {
    ami = "ami-033a1ebf088e56e81"
    instance_type = "t2.micro"    # change ami id for different region
    key_name = "linux"
     tags = {
        Name = "loop"
     }
  
  root_block_device {
    volume_size = 40      # we can give custom value here
  }
}
 
resource "aws_security_group" "devops-project-ani" {
  name        = "devops-project-ani"
  description = "Allow TLS inbound traffic"

  ingress = [
    for port in [22, 80, 443, 8080, 9000, 3000, 8082, 8081] : {
      description      = "inbound rules"
      from_port        = port
      to_port          = port
      protocol         = "tcp"
      cidr_blocks      = ["0.0.0.0/0"]
      ipv6_cidr_blocks = []
      prefix_list_ids  = []
      security_groups  = []
      self             = false
    }
  ]

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "devops-project-ani"
  }
}
