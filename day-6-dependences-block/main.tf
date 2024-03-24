resource "aws_instance" "test" {
    ami = "ami-02d7fd1c2af6eead0"
    instance_type = "t2.micro"
    key_name = "linux"
    tags = {
      Name = "block"
    }
  
}
resource "aws_s3_bucket" "test" {
    bucket = "cvbhjkuytdcvb"
    depends_on = [ aws_instance.test ]
  
}