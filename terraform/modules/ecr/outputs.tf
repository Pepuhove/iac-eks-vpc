output "repository_name" {
  description = "Name of the ECR repository"
  value       = aws_ecr_repository.name.name
}
output "repository_url" {
  description = "URL of the ECR repository"
  value       = aws_ecr_repository.name.repository_url
}