output "public" {
value = aws_instance.ec2.public_ip  
sensitive = true
}
output "private" {
    value = aws_instance.ec2.private_ip
}