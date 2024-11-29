# modules/ssm-document/outputs.tf
output "document_name" {
  value       = aws_ssm_document.this.name
  description = "Name of the SSM document"
}

output "document_arn" {
  value       = aws_ssm_document.this.arn
  description = "ARN of the SSM document"
}

output "role_arn" {
  value       = var.create_role ? aws_iam_role.automation_role[0].arn : ""
  description = "ARN of the automation role"
}
