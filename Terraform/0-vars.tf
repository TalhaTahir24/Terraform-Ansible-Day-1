variable "endpoint" {
type = string
description = "Proxmox URL"
sensitive = true
}
variable "api_token" {
type = string
description = "Proxmox API Key"
sensitive = true
}
