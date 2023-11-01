resource "github_repository" "git_repo_using_terraform" {
  name        = "myrepo-using-terraform"
  description = "This repo is created using terraform githun provider"

  visibility = "public"
  auto_init  = true
}

