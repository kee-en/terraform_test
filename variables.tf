variable "tag_list" {
  type = object({
    GBL_CLASS_0   = string
    GBL_CLASS_1   = string
    vpc_name      = string
    sub_pub1_name = string
    sub_pub2_name = string
    sub_pri1_name = string
    sub_pri2_name = string
    sub_db1_name  = string
    sub_db2_name  = string
    igw_name      = string
    ngw_name      = string
    rt_pub_name   = string
    rt_pri_name   = string
    rt_db_name    = string
  })

  default = {
    GBL_CLASS_0   = "SERVICE"
    GBL_CLASS_1   = "TEST"
    vpc_name      = "kien-vpc"
    sub_pub1_name = "kien-pub-sub-1"
    sub_pub2_name = "kien-pub-sub-2"
    sub_pri1_name = "kien-pri-sub-1"
    sub_pri2_name = "kien-pri-sub-2"
    sub_db1_name  = "kien-db-sub-1"
    sub_db2_name  = "kien-db-sub-2"
    igw_name      = "kien-igw"
    ngw_name      = "kien-ngw"
    rt_pub_name   = "kien-rt-public"
    rt_pri_name   = "kien-rt-private"
    rt_db_name    = "kien-rt-database"
  }
}

variable "cidr" {
  type = object({
    vpc_block      = string
    sub_pub1_block = string
    sub_pub2_block = string
    sub_pri1_block = string
    sub_pri2_block = string
    sub_db1_block  = string
    sub_db2_block  = string
    all_block      = string
  })

  default = {
    all_block      = "0.0.0.0/0"
    sub_db1_block  = "10.50.7.0/24"
    sub_db2_block  = "10.50.8.0/24"
    sub_pri1_block = "10.50.4.0/24"
    sub_pri2_block = "10.50.5.0/24"
    sub_pub1_block = "10.50.1.0/24"
    sub_pub2_block = "10.50.2.0/24"
    vpc_block      = "10.50.0.0/16"
  }
}
