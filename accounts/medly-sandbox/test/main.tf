resource "null_resource" "null" {}


module "test" {
  source = "../../../modules/test"
}
