terraform {
  backend "s3" {
    bucket         = "mybucket"   
    key            = "path/to/my/key"     
    region         = "eu-central-1"                                   
    encrypt        = true  
    use_lockfile   = true                           
  }
}