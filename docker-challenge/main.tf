terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 2.22.0"
    }
  }
}

provider "docker" {}

resource "docker_image" "simpleflaskservice" {
  name         = "registry.gitlab.com/alta3research/simpleflaskservice:1.0"
  keep_locally = true    // keep image after "destroy"
}

resource "docker_container" "simpleflaskservice" {
  image = docker_image.simpleflaskservice.image_id
  # here we removed the name "tutorial" for the container
  # and replace it with a call to a variable
  # name  = "tutorial"
  name = var.container_name
  ports {
    internal = var.int_port
    external = var.ext_port
  }
}

