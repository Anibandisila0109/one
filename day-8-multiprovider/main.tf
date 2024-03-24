provider "aws" {
    region = "ap-south-1"
  
}
# Another provider alias #
provider "aws" {
    region = "us-east-1"
    alias  = "america" 
  
} 
 resource "aws_s3_bucket" "test" {
    bucket = "del2-hyd-ap-hydnit-2"
   
 }
  resource "aws_s3_bucket" "test1" {
    bucket   = "del3-ts-hyd-mu-hyfnit-3"
    provider = aws.america
    
  }