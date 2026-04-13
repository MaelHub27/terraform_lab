variable "proxy_name" { type = string }
variable "external_port" { type = number }
variable "target_ip" { type = string }
variable "target_port" { type = number }
variable "nginx_image" { type = string }
variable "nginx_port" {
  type    = number
  default = 80
}
variable "proxy_ip" { type = string }
