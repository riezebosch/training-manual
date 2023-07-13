terraform {
  required_providers {
    github = {
      source  = "integrations/github"
      version = "~> 5.0"
    }

    restapi = {
      source  = "Mastercard/restapi"
      version = "1.18.1"
    }
  }
}

