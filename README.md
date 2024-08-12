# Demo Example to deploy Wordpress on EKS cluster
- Utilized Terraform v1.9.4
- Must run terraform init in dev and modules

### Modules

- EKS
- RDS
- VPC 
- Helm Deployments for Certmanager and wordpress

```
.
├── main
│   ├── dev.tfvars
│   ├── main.tf
│   ├── outputs.tf
│   ├── terraform.tfstate.d
│   │   ├── dev
│   │   └── stage
│   ├── terraform.tfvars
│   ├── tfplan_plain_txt.txt
│   ├── variables.tf
│   └── wordpress_tfplan
└── modules
    ├── cert-manager
    │   ├── main.tf
    │   ├── outputs.tf
    │   └── variables.tf
    ├── eks
    │   ├── main.tf
    │   ├── outputs.tf
    │   └── variables.tf
    ├── rds
    │   ├── main.tf
    │   ├── outputs.tf
    │   └── variables.tf
    ├── vpc
    │   ├── main.tf
    │   ├── outputs.tf
    │   └── variables.tf
    └── wordpress
        ├── main.tf
        ├── outputs.tf
        └── variables.tf
```
