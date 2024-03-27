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
    default = [ "dev","test" ]
    
  }


  resource "aws_instance" "sandboxes" {
    ami = "ami-033a1ebf088e56e81"
    instance_type = var.instance_type
    for_each = toset(var.sandboxes)
   # count = length(var.sandboxes)
    tags = {
       Name = "each.value"   # for a set, each value and each.key is the same
    }
    
  }
