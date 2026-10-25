# data "terraform_remote_state" "be_network" {
#   backend = "remote"

#   config = {
#     organization = "swl-tfc"

#     workspaces = {
#       name = "be-network"
#     }
#   }
# }

# data "terraform_remote_state" "be_sgp" {
#   backend = "remote"

#   config = {
#     organization = "swl-tfc"

#     workspaces = {
#       name = "be-sgp"
#     }
#   }
# }

data "tfe_outputs" "be_network" {
  workspace    = var.be_network
  organization = var.hcp_org_name
}

data "tfe_outputs" "be_sgp" {
  workspace    = var.be_sgp
  organization = var.hcp_org_name
}