variable "ami_id" {
  description = "variable for ami"
  type        = string
  default     = "ami-0ddda618e961f2270"
}

variable "az" {
  description = "variable for availability zone"
  type        = string
  default     = "us-east-2b"
}

variable "itype" {
  description = "variable for instance type"
  type        = string
  default     = "t2.micro"
}

variable "kname" {
  description = "variable for keyname"
  type        = string
  default     = "Travinsel12"
}

variable "ec2name" {
  description = "variable for ec2name"
  type        = string
  default     = "tfmvm1"
}


variable "user2" {
  description = "variable for iaamname"
  type        = string
  default     = "trav2"
}

variable "user1" {
  description = "variable for iaamname"
  type        = string
  default     = "trav"
}