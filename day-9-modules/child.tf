module "test" {
    source = "./module" 
    ami       	= "ami-02d7fd1c2af6eead0"
    instance_type = "t2.micro"
    key_name  	= "linux"
    name        = "test_ec2"
}