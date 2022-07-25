variable "tags" {
  type = object({
    GBL_CLASS_0 = string
    GBL_CLASS_1 = string
    vpc         = string
    sub_pub_1   = string
    sub_pub_2   = string
    sub_pri_1   = string
    sub_pri_2   = string
    sub_db_1    = string
    sub_db_2    = string
    igw         = string
    ngw         = string
    rt_public   = string
    rt_private  = string
    rt_database = string
  })

  default = {
    GBL_CLASS_0 = "SERVICE"
    GBL_CLASS_1 = "TEST"
    vpc         = "kien-vpc"
    sub_pub_1   = "kien-pub-sub-1"
    sub_pub_2   = "kien-pub-sub-2"
    sub_pri_1   = "kien-pri-sub-1"
    sub_pri_2   = "kien-pri-sub-2"
    sub_db_1    = "kien-db-sub-1"
    sub_db_2    = "kien-db-sub-2"
    igw         = "kien-igw"
    ngw         = "kien-ngw"
    rt_public   = "kien-rt-public"
    rt_private  = "kien-rt-private"
    rt_database = "kien-rt-database"
  }
}

variable "cidr_block" {
  type = object({
    vpc       = string
    sub_db_1  = string
    sub_db_2  = string
    sub_pri_1 = string
    sub_pri_2 = string
    sub_pub_1 = string
    sub_pub_2 = string
    all       = string
  })

  default = {
    all       = "0.0.0.0/0"
    sub_db_1  = "10.50.7.0/24"
    sub_db_2  = "10.50.8.0/24"
    sub_pri_1 = "10.50.4.0/24"
    sub_pri_2 = "10.50.5.0/24"
    sub_pub_1 = "10.50.1.0/24"
    sub_pub_2 = "10.50.2.0/24"
    vpc       = "10.50.0.0/16"
  }
}

variable "availability_zone" {
  type = object({
    ap_northeast_1a = string
    ap_northeast_1b = string
  })

  default = {
    ap_northeast_1a = "ap-northeast-1a"
    ap_northeast_1b = "ap-northeast-1b"
  }
}