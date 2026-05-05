# ──────────────────────────────────────────────────────────────────────────────
# Security Group
# ──────────────────────────────────────────────────────────────────────────────

resource "aws_security_group" "web" {
  name        = "${var.project_name}-${var.environment}-web-sg"
  description = "Allow inbound HTTP and restricted SSH; allow all outbound traffic."

  tags = {
    Name = "${var.project_name}-${var.environment}-web-sg"
  }
}

# SSH — restrict to a known IP in production; default allows any (dev only)
resource "aws_vpc_security_group_ingress_rule" "ssh" {
  security_group_id = aws_security_group.web.id
  description       = "SSH access from a trusted CIDR."

  ip_protocol = "tcp"
  from_port   = 22
  to_port     = 22
  cidr_ipv4   = var.allowed_ssh_cidr
}

# HTTP
resource "aws_vpc_security_group_ingress_rule" "http" {
  security_group_id = aws_security_group.web.id
  description       = "HTTP traffic from the public internet."

  ip_protocol = "tcp"
  from_port   = 80
  to_port     = 80
  cidr_ipv4   = "0.0.0.0/0"
}

# All outbound traffic
resource "aws_vpc_security_group_egress_rule" "all_outbound" {
  security_group_id = aws_security_group.web.id
  description       = "Allow all outbound traffic."

  ip_protocol = "-1"
  cidr_ipv4   = "0.0.0.0/0"
}

# ──────────────────────────────────────────────────────────────────────────────
# EC2 Instances
# ──────────────────────────────────────────────────────────────────────────────

resource "aws_instance" "web" {
  count = var.instance_count

  ami           = var.ami_id
  instance_type = var.instance_type
  key_name      = var.key_name

  vpc_security_group_ids = [aws_security_group.web.id]

  # Disable direct public IP assignment in production and use a bastion or SSM instead.
  # Set to true here for a dev/bootcamp environment to allow direct SSH access.
  associate_public_ip_address = true

  # Enable termination protection in production
  # disable_api_termination = var.environment == "prod" ? true : false

  root_block_device {
    volume_type           = "gp3"
    volume_size           = 20    # GiB
    encrypted             = true
    delete_on_termination = true
  }

  metadata_options {
    # Require IMDSv2 to mitigate SSRF attacks against the metadata endpoint
    http_tokens                 = "required"
    http_put_response_hop_limit = 1
    http_endpoint               = "enabled"
  }

  tags = {
    Name = "${var.project_name}-${var.environment}-server-${count.index + 1}"
  }

  lifecycle {
    # Prevent accidental replacement when only tags change
    ignore_changes = [tags]
  }
}