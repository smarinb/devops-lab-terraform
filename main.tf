# Sube tu clave pública a Hetzner
resource "hcloud_ssh_key" "me" {
  name       = "devops-lab-key"
  public_key = file(var.ssh_pubkey_path)
}

# Firewall básico (SSH/HTTP/HTTPS)
resource "hcloud_firewall" "basic" {
  name = "fw-devops-lab"

  rule {
    direction  = "in"
    protocol   = "tcp"
    port       = "22"
    source_ips = ["0.0.0.0/0", "::/0"]
  }

  rule {
    direction  = "in"
    protocol   = "tcp"
    port       = "80"
    source_ips = ["0.0.0.0/0", "::/0"]
  }

  rule {
    direction  = "in"
    protocol   = "tcp"
    port       = "443"
    source_ips = ["0.0.0.0/0", "::/0"]
  }
}

# Servidor (Ubuntu 24.04 + cloud-init mínimo)
resource "hcloud_server" "vm" {
  name        = var.server_name
  image       = "ubuntu-24.04"
  server_type = var.server_type
  location    = var.location

  ssh_keys     = [hcloud_ssh_key.me.id]
  firewall_ids = [hcloud_firewall.basic.id]

  user_data = <<-CLOUDINIT
  #cloud-config
  package_update: true
  packages:
    - curl
    - git
    - unzip
  runcmd:
    - ufw disable || true
  CLOUDINIT
}
