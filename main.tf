# Main file to deploy the lab infrastructure

# Proxies settings (name and port)
locals {
  proxies = {
    "proxy-alpha" = { port = var.proxy_alpha_port }
    "proxy-beta"  = { port = var.proxy_beta_port }
    "proxy-gamma" = { port = var.proxy_gamma_port }
  }
}

# Declared here to avoid re-destroying same image three times -> error messages
resource "docker_image" "nginx" {
  name         = "nginx:alpine"
  keep_locally = true
}

module "proxy" {
  source   = "./modules/proxy"
  for_each = local.proxies

  nginx_image   = docker_image.nginx.image_id
  proxy_name    = each.key
  external_port = each.value.port
  target_ip     = var.kali_ip
  target_port   = var.sliver_port
  proxy_ip      = var.proxy_ip
}

module "target" {
  source = "./modules/target"
}
