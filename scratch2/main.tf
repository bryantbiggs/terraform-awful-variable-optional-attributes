module "scratch" {
  source = "../scratch"

  things = {
    example = {
      something = {
        fancy = {
          magic = "abracadabra"
        }
      }
    }
  }
}

output "things" {
  value = module.scratch
}
