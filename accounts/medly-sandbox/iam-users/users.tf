variable "users" {
  default = [
    {
      name    = "amohite@medlypharmacy.com"
      pgp_key = "keybase:ashishmohite"
      role    = "DevOps"
    },
    {
      name    = "abhinav.m@medlypharmacy.com"
      pgp_key = "keybase:abhinavmanc"
      role    = "DevOps"
    },
    {
      name    = "bhimsenp@medlypharmacy.com"
      pgp_key = "keybase:bhimsenp"
      role    = "DevOps"
    },
    {
      name    = "gsgreen@medlypharmacy.com"
      pgp_key = "keybase:gsgreen"
      role    = "DevOps"
    }
  ]
  type        = list(map(string))
  description = "List of users for whom IAM needs to be created"
}
//Todo remove this duplication of users configuratin

