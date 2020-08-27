resource "grafana_data_source" "prometheus" {
  type = "prometheus"
  name = "prometheus"
  url = "http://demo.robustperception.io:9090/"
}
