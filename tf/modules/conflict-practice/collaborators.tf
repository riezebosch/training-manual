resource "github_repository_collaborator" "collaborator" {
  repository = resource.github_repository.this.name
  username   = var.student
  permission = "admin"
}
