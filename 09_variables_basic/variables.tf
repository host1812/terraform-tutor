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

variable "vn_name" {
  description = "Virtual Network Name"
  type        = string
  default     = "aftest"
}

variable "vn_subnet" {
  description = "Subnet Name"
  type        = string
}

variable "subnet_addresses" {
  description = "Subnet Addresses"
  type        = list(string)
  default     = ["10.0.0.0/16", "10.1.0.0/16"]
}

variable "pip_sku" {
  description = "Simple Map"
  type        = map(string)
  default = {
    "eastus"  = "Basic"
    "eastus2" = "Standard"
    "westus3" = "Standard"
  }
}

variable "common_tags" {
  type = map(string)
  default = {
    "env"   = "env"
    "other" = "other"
  }
}

variable "block" {
  description = "Block?"
  type        = string
  validation {
    condition     = var.block == "yes" || var.block == "no"
    error_message = "Can be 'yes' or 'no'."
  }
}
