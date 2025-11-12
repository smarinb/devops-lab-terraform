variable "hcloud_token" {
  description = "Hetzner Cloud API token"
  type        = string
  sensitive   = true
}

variable "server_name" {
  description = "Nombre del servidor"
  type        = string
  default     = "devops-lab-1"
}

variable "location" { # nbg1 (Núremberg) / fsn1 (Falkenstein) / hel1 (Helsinki)
  description = "Ubicación del DC"
  type        = string
  default     = "nbg1"
}

variable "server_type" { # plan
  description = "Tipo de servidor (CX22 recomendado)"
  type        = string
  default     = "cx22"
}

variable "ssh_pubkey_path" {
  description = "Ruta a tu clave pública"
  type        = string
  default     = "C:/Users/mamabase/.ssh/id_ed25519.pub"
}
