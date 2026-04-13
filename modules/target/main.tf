# Module responsible for victim creation

terraform {
  required_providers {
    docker = {
      source = "kreuzwerker/docker"
    }
  }
}

resource "docker_image" "ubuntu" {
  name         = "ubuntu:latest"
  keep_locally = true
}

resource "docker_container" "victim" {
  name       = "victim"
  image      = docker_image.ubuntu.image_id
  tty        = true
  stdin_open = true
  must_run   = true
}
