#### Description

This folder contains the Terraform code used to deploy the following resources: `AKS`, `PDZ`, `VNET`, `IAM` identities and roles. Some of the resources must be pre-created before running this code.

The `DEV` folder contains the tfvars file corresponding to the `DEV` environment. 

#### Prerequisites

- Terraform
- Azure CLI
- A service principal with necessary permissions
- Registered providers: Microsoft.ManagedIdentity and Microsoft.ContainerIstances

#### Provisioned resources

- AKS
- Private DNS Zone
- VNet, subnets and NSG
- IAM identities and roles

#### How to run

```
# Change workspace
cd infra/terraform

# Initialize
terraform init

# Run plan
terraform plan -var-file=DEV/terraform.tfvars -out=dev.plan

# Apply changes
terraform apply dev.plan -auto-approve
```

#### Security consideration

For security reasons, some of the variables are stored as secrets inside the Github Actions.

The Service Principl used in IaC must have the `Contributor` and `User Access Administrator` roles assigned to the target resource group.

The Terraform state file is stored in the shared resource group's storage account so the SPN must have `Storage Account Contributor` assigned to the shared storage. This is required in order to read the storage access keys and access the managed containers.

A security group must be pre-created in EntraID for the admin RBAC access in AKS.

#### Additional information
The SPN should not have permissions beyound its defined scope (the application resource group), except access to the shared storage account for storing the tfstate file. Attaching ACR to the AKS cluster and linking the app VNET to the shared VNET must be performed manually in this case.