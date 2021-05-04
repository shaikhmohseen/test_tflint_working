deployment_account = "medly-dev"
env                = "dev"
ibd_domain_name    = "ibd.dev-medly.io"

root_account_id = "arn:aws:iam::504691833145:root"

aws_account_ids = {
  uat            = "arn:aws:iam::618443492263:root"
  prod           = "arn:aws:iam::164055005537:root"
  test           = "arn:aws:iam::271400176074:root"
  sandbox        = "arn:aws:iam::042442756249:root"
  data_dev       = "arn:aws:iam::740951591572:root"
  data_uat       = "arn:aws:iam::079311778408:root"
  data_prod      = "arn:aws:iam::657721950513:root"
  root           = "arn:aws:iam::504691833145:root"
  security_tools = "arn:aws:iam::431209050961:root"
  log_archive    = "arn:aws:iam::027162919298:root"
}
lambda_arns = {
  watchtower_arn = "arn:aws:iam::164055005537:role/watchtowerService-prod-us-east-1-lambdaRole"
}
