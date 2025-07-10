variable "default_things" {
  description = "A collection of things that do things or don't, depending on how you look at it"
  type = object({
    something = optional(object({
      cool = optional(bool)
      fancy = optional(object({
        wizard = optional(bool)
        magic  = optional(string)
        spells = optional(list(string))
      }), {})
    }), {})
    something_else = optional(object({
      cool = optional(bool)
      fancy = optional(object({
        wizard = optional(bool)
        magic  = optional(string, "ITS MAGIC!")
        spells = optional(list(string))
      }), {})
    }), {})
  })
  default = {}
}


locals {
  foo = coalesce(var.default_things.something.fancy.magic, var.default_things.something_else.fancy.magic, "GOT NOTHING (which is actually something)")
}

output "foo" {
  value = local.foo
}

output "default_things" {
  value = var.default_things.something.fancy.magic
}

output "default_things_else" {
  value = var.default_things.something_else.fancy.magic
}
