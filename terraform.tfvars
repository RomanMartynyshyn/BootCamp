# ──────────────────────────────────────────────────────────────────────────────
# terraform.tfvars
#
# Default values for the dev/bootcamp environment.
# DO NOT commit sensitive values (keys, secrets) — use environment variables
# or a secrets manager instead.
# ──────────────────────────────────────────────────────────────────────────────

region         = "eu-north-1"
project_name   = "bootcamp"
environment    = "dev"

instance_count = 2
instance_type  = "t3.micro"

# Ubuntu 24.04 LTS (Noble Numbat) — eu-north-1 — 2024-04 release
ami_id         = "ami-0989fb15ce71ba39e"

# Name of your existing Key Pair in AWS (create via Console or CLI before apply)
key_name       = "my-bootcamp-key"

# Restrict SSH to your IP for better security, e.g. "203.0.113.5/32"
# "0.0.0.0/0" is acceptable for a short-lived bootcamp environment only.
allowed_ssh_cidr = "0.0.0.0/0"