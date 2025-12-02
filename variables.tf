variable "repository" {
  type        = string
  default     = "https://github.com/opsstation/terraform-azure-nat-gateway.git"
  description = "Terraform current module repo"

  validation {
    # regex(...) fails if it cannot find a match
    condition     = can(regex("^https://", var.repository))
    error_message = "The module-repo value must be a valid Git repo link."
  }
}

variable "label_order" {
  type        = list(any)
  default     = ["name", "environment"]
  description = "Label order, e.g. sequence of application name and environment `name`,`environment`,'attribute' [`webserver`,`qa`,`devops`,`public`,] ."
}

variable "managedby" {
  type        = string
  default     = "opsstation"
  description = "ManagedBy, eg 'opsstation'."
}

variable "location" {
  description = "Azure region to use"
  type        = string
  default     = ""
}

variable "name" {
  type        = string
  default     = ""
  description = "Name  (e.g. `app` or `cluster`)."
}

variable "environment" {
  description = "Project environment"
  type        = string
  default     = ""
}

variable "resource_group_name" {
  description = "Name of the resource group to use"
  type        = string
  default     = ""
}

variable "public_ip_zones" {
  description = "Public ip Zones to configure."
  type        = list(string)
  default     = null
}

variable "public_ip_ids" {
  description = "List of public ips to use. Create one ip if not provided"
  type        = list(string)
  default     = []
}

variable "create_public_ip" {
  description = "Should we create a public IP or not?"
  type        = bool
  default     = true
}

variable "nat_gateway_idle_timeout" {
  description = "Idle timeout configuration in minutes for Nat Gateway"
  type        = number
  default     = 4
}

variable "subnet_ids" {
  description = "Ids of subnets to associate with the Nat Gateway"
  type        = string
  default     = ""
}

variable "create_nat_gateway" {
  type    = bool
  default = true
}

variable "azurerm_subnet_nat_gateway_association_enabled" {
  type    = bool
  default = true
}

variable "enabled" {
  type    = bool
  default = true
}

variable "public_ip_sku" {
  type        = string
  default     = "Standard"
  description = "Specifies the SKU tier for the Public IP address used by the NAT Gateway. Must be 'Standard' for NAT Gateway compatibility."
}

variable "nat_gateway_sku_name" {
  type        = string
  default     = "Standard"
  description = "Specifies the SKU of the NAT Gateway resource. Currently, only 'Standard' is supported."
}
variable "public_ip_allocation_method" {
  type        = string
  default     = "Static"
  description = "Defines how the Public IP address is allocated. Must be 'Static' when used with a NAT Gateway."
}

variable "attributes" {
  type        = list(string)
  default     = []
  description = "Additional attributes (e.g. `1`)."
}