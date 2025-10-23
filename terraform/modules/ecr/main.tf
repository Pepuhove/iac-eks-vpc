resource "aws_ecr_repository" "name" {
  name = var.aws_repository_name
 
  tags = {
    Terraform = "true"
  }
}