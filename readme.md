# 🧱 DevOps Lab – Infraestructura con Terraform en Hetzner Cloud

Este repositorio contiene el código **Terraform** para desplegar la infraestructura base del laboratorio **DevOps**.  
El objetivo es automatizar la creación de una máquina virtual en **Hetzner Cloud** que servirá como entorno para prácticas con **Ansible**, **Docker**, **Kubernetes (k3s)** y **CI/CD (GitHub Actions)**.

---

## 🚀 Objetivos del proyecto

- Aprender **Infraestructura como Código (IaC)** con Terraform.  
- Desplegar servidores de forma reproducible en la nube.  
- Construir una base para prácticas DevOps reales: aprovisionamiento con Ansible, contenedores con Docker y despliegue con k3s.  
- Mantener **coste mínimo (<5 €/mes)** destruyendo recursos cuando no se usen.

---

## 🧩 Infraestructura desplegada

| Recurso | Descripción |
|----------|--------------|
| 🔐 **SSH Key** | Subida automáticamente a Hetzner Cloud. |
| 🔥 **Firewall** | Permite solo SSH (22), HTTP (80) y HTTPS (443). |
| 💻 **Servidor** | VM Ubuntu 24.04 (plan CX22 – 2 vCPU / 4 GB RAM / 40 GB SSD). |
| 🧾 **Cloud-init** | Instala herramientas básicas (`curl`, `git`, `unzip`) y desactiva `ufw`. |

---

## 🛠️ Prerrequisitos

- [Terraform ≥ 1.6](https://developer.hashicorp.com/terraform/downloads)
- [Cuenta en Hetzner Cloud](https://console.hetzner.cloud/)
- Un **API Token** válido:
  1. Entra a tu consola → *Security → API Tokens → Generate Token*
  2. Copia el valor y guárdalo como variable de entorno:
     ```bash
     export TF_VAR_hcloud_token="TU_TOKEN_AQUI"
     ```
- Clave SSH (si no tienes):
  ```bash
  ssh-keygen -t ed25519 -C "tu-email"
