# modules/ssm-document/main.tf
resource "aws_ssm_document" "this" {
  name            = var.name
  document_type   = var.document_type
  document_format = var.document_format
  content        = var.content

  tags = var.tags
}

resource "aws_iam_role" "automation_role" {
  count = var.create_role ? 1 : 0
  
  name        = var.role_name
  description = var.role_description

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "ssm.amazonaws.com"
        }
      }
    ]
  })

  tags = var.tags
}

resource "aws_iam_role_policy" "automation_policy" {
  for_each = var.create_role ? var.role_policies : {}

  name = each.value.policy_name
  role = aws_iam_role.automation_role[0].id
  policy = each.value.policy
}
