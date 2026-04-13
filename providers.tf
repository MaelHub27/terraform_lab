terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = ">= 4.0.0"
    }
  }
}

### DOCKER ###

# Single command to get the user id on the system and allow for usage of podman instead of docker (privilege issue)
data "external" "user_info" {
  program = ["sh", "-c", "echo \"{\\\"uid\\\": \\\"$(id -u)\\\"}\""]
}

provider "docker" {
  host = "unix:///run/user/${data.external.user_info.result.uid}/podman/podman.sock"
}

# provider "docker" {
#   # For docker socket, problem -> root privilege (daemon)
#   host = "unix:///var/run/docker.sock"
# }

