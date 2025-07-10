variable "default_things" {
  description = "A collection of things that do things or don't, depending on how you look at it"
  type = object({
    something = optional(object({
      cool = optional(bool)
      fancy = optional(object({
        wizard = optional(bool)
        magic  = optional(string)
        spells = optional(list(string))
      }))
    }))
    something_else = optional(object({
      cool = optional(bool)
      fancy = optional(object({
        wizard = optional(bool)
        magic  = optional(string)
        spells = optional(list(string))
      }))
    }))
  })
  default = null
}


locals {
    # This works - wtf
    foo = try(var.default_things.something.fancy.magic, var.default_things.something_else.fancy.magic, "GOT NOTHING (which is actually something)")
}

output "foo" {
    value = local.foo
}

resource "local_file" "foo" {
  content  = local.foo
  filename = "foo.txt"
}
