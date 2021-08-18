provider "vault" {
  address         = "http://YOURVAULTADDR:8200/"
  skip_tls_verify = true
  token           = "YOURTOKEN"
}