variable "resource_group_name" {
  type        = string
  description = "Name of the resource group"
}

variable "location" {
  type        = string
  default     = "canadacentral"
}

variable "container_image" {
  type        = string
  description = "Container image URL from Azure Container Registry"
}
