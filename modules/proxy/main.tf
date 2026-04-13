# Module responsible for proxy creation and configuration

terraform {
  required_providers {
    docker = {
      source = "kreuzwerker/docker"
    }
  }
}

resource "local_file" "config" {
  content = templatefile("${path.root}/configs/nginx.conf.tftpl", {
    target_ip   = var.target_ip
    target_port = var.target_port
  })
  filename = abspath("${path.root}/configs/${var.proxy_name}.conf")
}

resource "docker_container" "nginx" {
  name  = var.proxy_name
  image = var.nginx_image
  ports {
    internal = var.nginx_port
    external = var.external_port
    ip       = var.proxy_ip
  }
  volumes {
    host_path      = local_file.config.filename
    container_path = "/etc/nginx/conf.d/default.conf"
  }
}
