module "caption-this" {
  source       = "./modules/caption-this"
  GITHUB_TOKEN = var.GITHUB_TOKEN
}

output "students" {
  value = module.caption-this.collaborators
}
