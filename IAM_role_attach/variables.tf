variable "region_name" {
    description = "region to create the resource"
    type = string
  
}
variable "ec2_instance_type" {
  description = "Instance type to create the resource"
  type = string
}

variable "image_id" {
    description = "image AMI to create the resource"
    type = string
  
}

variable "role_name" {
    description = "Role name to attach"
    type = string
  
}