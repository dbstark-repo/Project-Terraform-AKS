# Project-Terraform-AKS
A simple demonstration on creation of resources using terraform for two environments - dev and stage. The purpose of this project is to enforce terraform authentication via spn and necessary rbac in the subscription before creation of actual resources.

**bootstrap/:**  

This is an isolated step which runs in the beginning before creating actual resources as the SPN details will be later required to authenticate terraform in Azure. Here, this layer:
1. creates service principal, resource group and a key vault
2. stores service principal client secret in the key vault

Once bootstrap runs successfully, to enforce terraform to use the spn, on the terminal, run:  

**export ARM_CLIENT_ID=""**  

**export ARM_CLIENT_SECRET=""**  

**export ARM_TENANT_ID=""**

**export ARM_SUBSCRIPTION_ID=""**  
<br>
<br>
**environments/:**  

contains dev and stage that created actual resources

**modules/:**  

contains the resource modules
