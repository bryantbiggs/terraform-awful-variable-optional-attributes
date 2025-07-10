module "main_thing" {
    source = "../.."

    things = {
        one = {
            something = {
                cool = false
                fancy = {
                    wizard = false
                    magic  = "no magic"
                    spells = []
                }
            }
        }
    }

    default_things = {
        fance = {
            # This DOES NOT WORK !!!
            magic = "I'm the captain now"
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
