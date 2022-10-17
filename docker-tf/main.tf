terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 2.22.0" // changed version 2.13 to 2.22
    }
  }
}

provider "docker" {}

resource "docker_image" "nginx" {
  name         = "nginx:latest" #correctedfrom image_id to latest
  keep_locally = true
}

resource "docker_container" "nginx" {
  image = docker_image.nginx.image_id /* changed from latest to image_id */
  name  = "tutorial"
  ports {
    internal = 80
    external = 2224
  }
}
