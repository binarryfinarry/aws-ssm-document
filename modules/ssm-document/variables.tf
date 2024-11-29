# modules/ssm-document/variables.tf
variable "name" {
  type        = string
  description = "Name of the SSM document"
}

variable "document_type" {
  type        = string
  description = "Type of the SSM document"
}

variable "document_format" {
  type        = string
  description = "Format of the SSM document"
  default     = "YAML"
}

variable "content" {
  type        = string
  description = "Content of the SSM document"
}

variable "tags" {
  type        = map(string)
  description = "Tags to apply to resources"
  default     = {}
}

variable "create_role" {
  type        = bool
  description = "Whether to create IAM role for automation"
  default     = false
}

variable "role_name" {
  type        = string
  description = "Name of the IAM role"
  default     = ""
}

variable "role_description" {
  type        = string
  description = "Description of the IAM role"
  default     = ""
}

variable "role_policies" {
  type = map(object({
    policy_name = string
    policy      = string
  }))
  description = "Map of IAM policies to attach to the role"
  default     = {}
}
