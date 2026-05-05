# Infrastructure — `infra` branch

This branch contains the **Terraform** configuration that provisions the AWS
infrastructure for the BootCamp project.

---

## Architecture Overview

```
AWS (eu-north-1)
│
├── Security Group  (bootcamp-dev-web-sg)
│   ├── Inbound  :22  TCP — SSH   (restricted CIDR)
│   ├── Inbound  :80  TCP — HTTP  (0.0.0.0/0)
│   └── Outbound :*   ALL         (0.0.0.0/0)
│
├── EC2 Instance — bootcamp-dev-server-1  (t3.micro, Ubuntu 24.04)
└── EC2 Instance — bootcamp-dev-server-2  (t3.micro, Ubuntu 24.04)
```

Both instances run in the **default VPC** of the selected region with a public
IP address (suitable for a short-lived dev/bootcamp setup).

---

## File Structure

| File | Purpose |
|------|---------|
| `main.tf` | Terraform & provider configuration, version constraints, default tags |
| `ec2.tf` | Security Group rules and EC2 instance resources |
| `variables.tf` | All input variables with types, descriptions and validation |
| `outputs.tf` | Useful output values after `terraform apply` |
| `terraform.tfvars` | Default variable values for the dev environment |
| `.gitignore` | Prevents committing state files, secrets and cache |


## Cost Estimate (eu-north-1, On-Demand)

| Resource | Qty | $/hr | $/month (est.) |
|----------|-----|------|----------------|
| t3.micro | 2 | ~$0.0118 | ~$17 |
| gp3 20 GiB | 2 | — | ~$2 |
| Public IP | 2 | $0.005 | ~$7 |
| **Total** | | | **~$26** |

Costs are covered by the **AWS Free Tier** for the first 12 months (750 hrs/month of t3.micro).

---

## Related Branches

| Branch | Contents |
|--------|---------|
| [`docker`](../../tree/docker) | Dockerfiles for backend and frontend |
| [`pipeline`](../../tree/pipeline) | GitHub Actions CI configuration |
| [`infra`](../../tree/infra) | ← **you are here** — Terraform AWS infrastructure |
