data "aws_ami" "amzlinux" {
    most_recent = true
    owners = ["amazon"]

   filter {
     name = "name"
     values = ["amzn2-ami-hvm-*-gp2"]
   }
   filter {
     name = "root-device-type"
     values = ["ebs"]
   }
   filter {
     name = "virtualization-type"
     values = ["hvm"]
   }

}
 data "aws_security_group" "allow_tls" {
    id = "sg-0b0683dd4f96d3f7c"
   
 }
 data "aws_subnet" "dev" {
    id = "subnet-0551d8e8bde65f9f1"
    
} 