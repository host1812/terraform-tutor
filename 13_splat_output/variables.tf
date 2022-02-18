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

variable "vnname" {
  type    = string
  default = "af"
}

variable "vnets" {
  type    = set(string)
  default = ["test", "abra", "cadarbra"]
}
