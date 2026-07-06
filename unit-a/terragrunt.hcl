terraform {
    source = "."
}

remote_state {
    backend = "local"

    config = {
        path = "/tmp/terragrunt-git-repo-state/unit-a"
    }
    
    generate =  {
        path = "backend.tf"
        if_exists = "overwrite_terragrunt"
    }
}