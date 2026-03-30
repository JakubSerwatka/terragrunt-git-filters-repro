terraform {
    source = "."
}

remote_state {
    backend = "local"

    config = {
        path = "/tmp/terragrunt-git-repo-state/${path_relative_to_include()}"
    }
    
    generate =  {
        path = "backend.tf"
        if_exists = "overwrite_terragrunt"
    }
}