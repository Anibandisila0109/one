#  # example-1 without list variable
# resource "aws_instance" "test" {
#  ami = "ami-033a1ebf088e56e81"
#  instance_type = "t2.micro"
#  key_name = "linux"
#    count = 2
#    tags = {
#       Name = "dev"
#       name = "dev.${count.index}"
#    }
  
# }


 variable "ami" {
    type = string
    default = "ami-033a1ebf088e56e81"
   
 }
  variable "instance_type" {
    type = string
    default = "t2.micro"
    
  }
   variable "sandboxes" {
    type = list(string)
     default = [ "dev","test","prod"]
   }

   resource "aws_instance" "sandboxes" {
    ami = var.ami
    instance_type = var.instance_type
    count = length(var.sandboxes)
#      tags = {
#         Name = "webec2"
#         Name = "webec2.${count.index}"
#      }
     
#    }
     tags = {
        Name = var.sandboxes[count.index]
     }
   }

    