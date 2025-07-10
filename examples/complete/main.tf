module "main_thing" {
  source = "../.."

  things = {
    no_magic = {
      something = {
        fancy = {
          wizard = false
          magic  = "no magic"
          # spells = [
        }
      }
    }
    witch = {
      something = {
        fancy = {
          wizard = true
          magic  = "witchcraft"
          # spells = ["potion", "curse"]
        }
      }
    }
  }

  default_things = {
    something = {
      fancy = {
        spells = ["HOLY SHIT!!!"]
      }
    }
  }
}

output "main_thing" {
  value = module.main_thing
}

resource "null_resource" "main_thing" {
  provisioner "local-exec" {
    command = "echo '${jsonencode(module.main_thing)}' | jq '.' > main_thing.json"
  }
}
