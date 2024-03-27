locals {
  bucket-name = "${var.layer}-${var.env}-bucket-hydeap"
   
}
 resource "aws_s3_bucket" "demo" {
    # bucket = "web-dev-bucket"
    # bucket-name = "${var.layer}-${var.env}-bucket-hydeap"
   bucket = local.bucket-name
     tags = {
       # name = "${var.layer}-${var.env}-bucket-hydeap"
         name = local.bucket-name
         Environment = var.env
     }
 }