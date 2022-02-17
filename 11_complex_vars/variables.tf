variable "bu" {
  description = "Business Unit"
  type        = string
  default     = "hr"
}

variable "env" {
  description = "Environment Name"
  type        = string
  default     = "dev"
}

variable "rgname" {
  description = "Resournce Group Name"
  type        = string
  default     = "aftest"
}

variable "rgloc" {
  description = "Resource Group Location"
  type        = string
  default     = "westus3"
}

variable "db_name" {
  description = "DB Name"
  type        = string
}

variable "db_admin_username" {
  description = "DB Admin Username"
  type        = string
  sensitive   = true
}

variable "db_admin_password" {
  description = "DB Admin Password"
  type        = string
  sensitive   = true
}

variable "db_size_mb" {
  description = "DB Size (MB)"
  type        = number
}

variable "db_auto_growth_enabled" {
  description = "DB Auto Growth Enabled"
  type        = bool
}
