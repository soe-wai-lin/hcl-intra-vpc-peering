# data "terraform_remote_state" "be_network" {
#   backend = "remote"

#   config = {
#     organization = "swl-tfc"

#     workspaces = {
#       name = "be-network"
#     }
#   }
# }

# data "terraform_remote_state" "fe_sgp" {
#   backend = "remote"

#   config = {
#     organization = "swl-tfc"

#     workspaces = {
#       name = "fe-sgp"
#     }
#   }
# }

data "tfe_outputs" "be_network" {
  workspace    = var.be_network
  organization = var.hcp_org_name
}

data "tfe_outputs" "fe_sgp" {
  workspace    = var.fe_sgp
  organization = var.hcp_org_name
}