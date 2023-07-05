resource "github_repository" "this" {
  name       = "caption-this"
  visibility = "public"
  has_issues = true

  template {
    owner                = "githubtraining"
    repository           = "caption-this"
    include_all_branches = true
  }
}
