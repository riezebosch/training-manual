resource "github_repository_collaborator" "collaborator" {
  repository = resource.github_repository.this.name
  for_each   = local.collaborators
  username   = each.value
  permission = "push"
}
