terraform {
  required_providers {
    fastly = {
      source  = "fastly/fastly"
      version = ">= 5.5.0"
    }
  }
}

# Configure the Fastly Provider
provider "fastly" {
  api_key = "test"
}

# Create a Service
resource "fastly_service_vcl" "myservice" {
  name = "myawesometestservice"

  domain {
    name = "example.com"
  }

  vcl {
    name = "main"
    content = <<VCL
      vcl 4.0;
      backend default {
        .host = "example.com";
      }
    VCL
    main = true
  }
}

# Create a Service
resource "fastly_service_vcl" "myservice2" {
  name = "myawesometestservice2"

  domain {
    name = "example2.com"
  }
}