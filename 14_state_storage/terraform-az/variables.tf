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

variable "storage_account_name" {
  description = "Storage Account Name"
  type        = string
  default     = "terraform-storage"
}

variable "storage_containers" {
  description = "Storage Containers To Create"
  type        = set(string)
}
