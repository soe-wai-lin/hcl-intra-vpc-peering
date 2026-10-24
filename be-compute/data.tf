data "terraform_remote_state" "be_network" {
  backend = "remote"

  config = {
    organization = "swl-tfc"

    workspaces = {
      name = "be-network"
    }
  }
}

data "terraform_remote_state" "be_sgp" {
  backend = "remote"

  config = {
    organization = "swl-tfc"

    workspaces = {
      name = "be-sgp"
    }
  }
}