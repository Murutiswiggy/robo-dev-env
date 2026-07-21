variable "project" {
  default = "roboshop"
}

variable "environment" {
  default = "dev"
}

variable "zone_id" {
  default = "Z017001715WLIKY04KSY9"
}

variable "domain_name" {
  default = "computerservices.co.in"
}

variable "mysql_root_password" {
  type = string
}

# variable "components" {
#   type = list(string)
#   default = [ 
    
#    "mongodb", "redis", 
#   #  "mysql", "rabbitmq",
#   #   "catalogue", "user", "cart", "shipping", "payment",
  
# ]
# }