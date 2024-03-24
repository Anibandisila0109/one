provider "aws" {
    region = "us-east-1"
  
}
  resource "aws_instance" "web" {
    ami = "ami-02d7fd1c2af6eead0"    # change ami id for different region #
    instance_type = "t2.micro"
    key_name = "linux"                # change key name as for your step #
    user_data = file("test.sh")       # define your path and file name #

     tags = {
        Name = "main-ec2"
     }    
  }