resource "github_repository" "this" {
  name                 = "conflict-practice-${var.student}"
  visibility           = "public"
  has_issues           = true
  vulnerability_alerts = true
}

resource "github_actions_repository_permissions" "this" {
  repository = resource.github_repository.this.name
  enabled    = false
}

resource "restapi_object" "import" {
  depends_on    = [resource.github_actions_repository_permissions.this]
  create_method = "PUT"
  read_path     = "/repos/{id}/import"
  path          = "/repos/{id}/import"
  object_id     = resource.github_repository.this.full_name
  data = jsonencode({
    vcs     = "git"
    vcs_url = "https://github.com/githubtraining/conflict-practice.git"
  })
}

resource "time_sleep" "import" {
  depends_on      = [resource.restapi_object.import]
  create_duration = "5s"
}

data "http" "import-ready" {
  depends_on = [resource.time_sleep.import]
  url        = "https://api.github.com/repos/${resource.github_repository.this.full_name}/import"

  request_headers = {
    Accept               = "application/vnd.github+json"
    Authorization        = "Bearer ${var.GITHUB_TOKEN}"
    X-GitHub-Api-Version = "2022-11-28"
  }

  lifecycle {
    postcondition {
      condition     = jsondecode(self.response_body).status == "complete"
      error_message = "Import not ready yet"
    }
  }
}
