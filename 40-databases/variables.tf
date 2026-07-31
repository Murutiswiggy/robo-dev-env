variable "project" {
  default = "roboshop"
}

variable "environment" {
  default = "dev"
}

variable "zone_id" {
  default = "Z08620151IDY1EKIT0XI7"
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