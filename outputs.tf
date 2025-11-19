# outputs.tf – FULL DNS SETUP
output "zone_ids" {
  description = "Cloudflare Zone IDs – saved forever in Terraform state"
  value       = { for k, z in cloudflare_zone.this : z.zone => z.id }
}

output "nameservers" {
  description = "Give these exact nameservers to the domain registrar"
  value       = { for k, z in cloudflare_zone.this : z.zone => z.name_servers }
}

output "management_forever" {
  value = <<EOT

=== CLOUDFLARE IS NOW 100% MANAGED BY TERRAFORM ===

Zone IDs (above) are saved forever – never look them up again.

From now on, any change = edit code → terraform apply
Examples:
  • Add new subdomain
  • Turn LOG → BLOCK on WAF / Rate Limiting
  • Disable a noisy Managed Rule
  • Adjust Bot Management, SSL, etc.

Next step today:
→ Update nameservers at registrar to the ones shown above.

EOT
}
