variable "security_groups"{
    type = map(string)
    default = {
        
        "security_group_1" = "sg-0e7525bcc351fc743"
        "security_group_2" = "sg-0b907923ddadc52e0"
    }
}

variable "instance_type"{
    type = string
    default = "t2.micro"
}

variable "ami" {
    type = string
    default = "ami-007855ac798b5175e"
}

variable "subnet"{
    type = string
    default = "	subnet-0121c45f847534365"
}

variable "bucket"{
    
    default = "my-tf-test-bucket89"
}

variable environment{
    type = string
    description = "Environment for deployment"
    default = "dev"
}