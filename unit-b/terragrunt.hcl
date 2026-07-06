terraform {
    source = "."
}

remote_state {
    backend = "local"

    config = {
        path = "/tmp/terragrunt-git-repo-state/unit-b"
    }
    
    generate =  {
        path = "backend.tf"
        if_exists = "overwrite_terragrunt"
    }
}

dependency "unit-a" {
    config_path = "../unit-a"

    mock_outputs = {
          unit-a_output = "mock-unit-a-output"
      }
}

inputs = {
    dummy = dependency.unit-a.outputs.unit-a_output
}