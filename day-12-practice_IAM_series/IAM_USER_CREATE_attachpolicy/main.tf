# configured aws provider with proper credentials
provider  "aws" {
    region = "us-east-1"
    profile = "default"

} 

# create an iam user
resource "aws_iam_user" "iam_user" {
    name = "iam"
  
}
# give the iam user programatic access
resource "aws_iam_access_key" "iam_access_key" {
    user = aws_iam_user.iam_user.name
  
}
# creat the inline policy
data "aws_iam_policy_document" "s3_get_put_delete_policy_document" {
    statement {
      actions = [
        "s3:putobject",
        "s3:getobject",
        "s3:deleteobject"
      ]
      resources = [
        "arn:aws:s3:::s3fullaccess777/*"
      ]
    }
  
}
# attach the policy to the user
resource "aws_iam_user_policy" "s3_get_put_delete_policy" {
  name = "s3-get-put-delete"
  user = aws_iam_user.iam_user.name
  policy = data.aws_iam_policy_document.s3_get_put_delete_policy_document.json
  
}