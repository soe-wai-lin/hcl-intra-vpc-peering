data "terraform_remote_state" "fe_network" {
  backend = "remote"

  config = {
    organization = "swl-tfc"

    workspaces = {
      name = "fe-network"
    }
  }
}

data "terraform_remote_state" "be_network" {
  backend = "remote"

  config = {
    organization = "swl-tfc"

    workspaces = {
      name = "be-network"
    }
  }
}