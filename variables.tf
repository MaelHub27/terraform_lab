variable "kali_ip" {
  description = "IP adress of C2 server (kali in this case)"
  type        = string
}

variable "sliver_port" {
  description = "Port Sliver is listening on"
  type        = number
}

variable "proxy_alpha_port" {
  type = number
}

variable "proxy_beta_port" {
  type = number
}

variable "proxy_gamma_port" {
  type = number
}

variable "proxy_ip" {
  type = string
}