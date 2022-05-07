resource "tencentcloud_ssl_certificate" "domain" {
  cert = var.cert
  key  = var.key
  type = var.type
  name = "*.${var.name}"
}
