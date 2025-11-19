output "nameservers" {
  value = { for k, z in cloudflare_zone.this : z.zone => z.name_servers }
}

output "next_steps" {
  value = "Change your registrar nameservers to the ones above – done!"
}
