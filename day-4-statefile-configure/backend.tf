terraform {
  backend "s3" {
    bucket = "rasbanqwertydi786123"
    key = "terraform.tfstate"
    region = "us-east-1"
    dynamodb_table = "terraform -state-lock-dynamo"
    encrypt = true
  
    }
}