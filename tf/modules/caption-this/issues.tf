resource "github_issue" "collaborators" {
  repository = github_repository.this.name
  title      = "Add collaborators to this repo"
  body       = <<EOT
## Comment below to be added as a collaborator

We will all be using this repository today. Even though it's public right now, you will not be able to make changes until you're given the correct permissions. We've automated this process via the GitHub API. Once you comment, we will add you as a collaborator.

You'll start to receive a lot of emails. (❗) You can slow these down immediately by clicking the **Unwatch** button at the top of the page and selecting either the **Participating and @mentions** or **Ignore** option.
EOT
}

# TODO: unable to use this since the response is not properly parsed: https://github.com/integrations/terraform-provider-github/issues/1776
# data "github_rest_api" "comments" {
#   endpoint = "repos/${resource.github_repository.this.full_name}/issues/${resource.github_issue.collaborators.number}/comments"
# }


data "http" "comments" {
  url = "https://api.github.com/repos/${resource.github_repository.this.full_name}/issues/${resource.github_issue.collaborators.number}/comments"
  request_headers = {
    Accept               = "application/vnd.github+json"
    Authorization        = "Bearer ${var.GITHUB_TOKEN}"
    X-GitHub-Api-Version = "2022-11-28"
  }
}
