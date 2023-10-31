# Terraform Azure Deployment
The Architecture is shown in the picture, the picture is taken from: https://microsoftlearning.github.io/AZ-104-MicrosoftAzureAdministrator/Instructions/Labs/LAB_06-Implement_Network_Traffic_Management.html#architecture-diagram

Knowledge wise you must be familiar with simple Terraform commands

Steps to proivision:
    1. Preferably download the repository
   
    2. Make sure you are signed in to your Azure account and have set the right subscription to provision resources to.

    3. Running "terraform init" Initializes a working directory containing Terraform configuration files.

    4. Running "terraform fmt" rewrites Terraforms configuration files to a canonical format and style. good for readability.
   
    5. Running "terraform validate" checks the syntax and internal consistency of Terraforms configuration files.
   
    6. Running "terraform plan" creates an execution plan and displays what will be deployed when running "terraform apply".
   
    7. Running "terraform plan -out ./run-this-deployment.tfplan" creates an execution plan and saves it to the file specified.
   
    8.  Running "terraform apply -out ./run-this-deployment.tfplan" applies the deployment/changes proposed in "./run-this-deployment.tfplan".

Added two scripts.
The EnableRouting script is for the vm0 route-table to work as vm0 will act as a "router" in this case. Routing traffic from vnet2 to vnet3. This is needed because vnet2 and vnet3 are not peered as peering is non-transitive.

Use Ip Flow Verify or connection troubleshoot for example to check the hops and routes the vms take.

The WebserverIIS is to install IIS on the virtual machines so they have something to listen on via HTTP on port 80. If the vms are not listening on port 80 the tcp-health probe will fail.

There are many more commands, for starters this will be more than enough!


Have fun!