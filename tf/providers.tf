terraform {
  required_providers {
    github = {
      source  = "integrations/github"
      version = "~> 5.0"
    }

    http-full = {
      source  = "salrashid123/http-full"
      version = "1.3.1"
    }

    restapi = {
      source  = "Mastercard/restapi"
      version = "1.18.1"
    }

    curl2 = {
      source  = "mehulgohil/curl2"
      version = "1.6.1"
    }
  }
}

provider "github" {
}

provider "restapi" {
  uri = "https://api.github.com/"
  headers = {
    Accept               = "application/vnd.github+json"
    Authorization        = "Bearer ${var.GITHUB_TOKEN}"
    X-GitHub-Api-Version = "2022-11-28"
  }
  write_returns_object = true
  debug                = true
}
