module "caption-this" {
  source       = "./modules/caption-this"
  GITHUB_TOKEN = var.GITHUB_TOKEN
}

module "conflict-practice" {
  for_each     = module.caption-this.collaborators
  source       = "./modules/conflict-practice"
  student      = each.value
  GITHUB_TOKEN = var.GITHUB_TOKEN
}

output "students" {
  value = module.caption-this.collaborators
}
