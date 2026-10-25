# data "terraform_remote_state" "fe_network" {
#   backend = "remote"

#   config = {
#     organization = "swl-tfc"

#     workspaces = {
#       name = "fe-network"
#     }
#   }
# }

# data "terraform_remote_state" "be_network" {
#   backend = "remote"

#   config = {
#     organization = "swl-tfc"

#     workspaces = {
#       name = "be-network"
#     }
#   }
# }

data "tfe_outputs" "be_network" {
  workspace    = var.be_network
  organization = var.hcp_org_name
}

data "tfe_outputs" "fe_network" {
  workspace    = var.fe_network
  organization = var.hcp_org_name
}