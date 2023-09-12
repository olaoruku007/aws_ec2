variable "region" {
  description = "The region the resources will be launched"
  type        = string
  default     = "us-east-2"
}

variable "ami" {
  description = "The instance ami for the webserver"
  type        = string
  default     = "ami-0a04068a95e6a1cde"
}

variable "instance_type" {
  description = "The instance type for the instance"
  type        = string
  default     = "t2.small"
}

variable "server_port" {
  description = "The server port for the instance"
  type        = number
  default     = 22
}

variable "server_port1" {
  description = "The server port for the instance"
  type        = number
  default     = 0
}

variable "server_port2" {
  description = "The server port for the instance"
  type        = number
  default     = 80
}

variable "server_port3" {
  description = "The server port for the instance"
  type        = number
  default     = 8080
}