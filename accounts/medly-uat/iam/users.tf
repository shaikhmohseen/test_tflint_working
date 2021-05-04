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
    },
    {
      name    = "atul.warghane@medlypharmacy.com"
      pgp_key = "keybase:atulyw"
      role    = "DevOps"
    },
    {
      name    = "shadja.chaudhari@medlypharmacy.com"
      pgp_key = "keybase:shadjachaudhari"
      role    = "DevOps"
    },
    {
      name    = "sagar.maurya@medlypharmacy.com"
      pgp_key = "keybase:sagarmaurya"
      role    = "DevOps"
    },
    {
      name    = "sagar.rakshe@medlypharmacy.com"
      pgp_key = "keybase:sagarrakshe"
      role    = "DevOps"
    },
    {
      name    = "siddarth.shashikar@medlypharmacy.com"
      pgp_key = "keybase:siddharthshashik"
      role    = "DevOps"
    }
  ]
  type        = list(map(string))
  description = "List of users for whom IAM needs to be created"
}
//Todo remove this duplication of users configuratin

