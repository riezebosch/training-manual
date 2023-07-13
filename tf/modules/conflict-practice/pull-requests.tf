resource "github_repository_pull_request" "game-manual" {
  depends_on      = [data.http.import-ready]
  base_repository = github_repository.this.name
  base_ref        = "main"
  head_ref        = "manual"
  title           = "Updates to game manual"
  body            = <<EOT
This pull request edits the wording of some language on the main page. It appears that it has also been edited on main, because there's a merge conflict. Please make sure that all the words are the ones that you'd like to use, and that there aren't any lines of text missing.

If you need any help resolving this conflict, check out this video:

<https://user-images.githubusercontent.com/17183625/106972130-1a611700-6705-11eb-8858-a9ef429e2a60.mp4>
EOT
}

resource "github_repository_pull_request" "minor-css-fixes" {
  depends_on      = [resource.github_repository_pull_request.game-manual]
  base_repository = github_repository.this.name
  base_ref        = "main"
  head_ref        = "css-changes"
  title           = "Minor CSS fixes"
  body            = <<EOT
This pull request makes some small changes to the CSS. Pick the CSS that you think makes the most sense given the history of the file on both branches and resolve the merge conflict.

If you need any help resolving this conflict, check out this video:

<https://user-images.githubusercontent.com/17183625/106972084-06b5b080-6705-11eb-8f57-d81559307822.mp4>
EOT
}

resource "github_repository_pull_request" "readme-update" {
  depends_on      = [resource.github_repository_pull_request.minor-css-fixes]
  base_repository = github_repository.this.name
  base_ref        = "main"
  head_ref        = "readme-update"
  title           = "Update README"
  body            = <<EOT
This pull request updates the README.md. Resolve the merge conflicts and make sure the final version of the README.md is accurate and descriptive.

If you need any help resolving this conflict, check out this video:

<https://user-images.githubusercontent.com/17183625/106972095-0ddcbe80-6705-11eb-9cc8-6df603e22910.mp4>
EOT
}
