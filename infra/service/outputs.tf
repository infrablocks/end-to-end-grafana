output "address" {
  value = data.template_file.grafana_dns_name.rendered
}