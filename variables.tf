variable "user_name" {
  description = "IAM accout name"
}

variable "group_name" {
  default     = ""
  type        = "string"
  description = "IAM group name"
}

variable "isAdmin" {
  default     = false
  description = "Specifies if user should be added into the admin group"
}

variable "isViewer" {
  default     = false
  description = "Specifies  if user should be added into read-only group"
}

variable "admin_group_name" {
  default     = "admins"
  description = "Name of the already existing admin group"
}

variable "viewer_group_name" {
  default     = "read-only"
  description = "Name of the already existing read-only group"
}

variable "hasCustomPolicy" {
  default     = false
  description = "Specifies if user has customer policy"
}

variable "custom_policy_document_file_name" {
  description = "File name of the custom policy document "
  default     = "custom-policy.json"
}
