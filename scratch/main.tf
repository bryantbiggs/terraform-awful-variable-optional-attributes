variable "things" {
  description = "A collection of things that do things or don't, depending on how you look at it"
  type = map(object({
    something = optional(object({
      cool = optional(bool, true)
      fancy = optional(object({
        wizard = optional(bool, true)
        magic  = optional(string)
        spells = optional(list(string), ["fireball", "lightning bolt"])
      }))
    }))
    something_else = optional(object({
      cool = optional(bool, true)
      fancy = optional(object({
        wizard = optional(bool, true)
        magic  = optional(string, "abracadabra")
        spells = optional(list(string), ["fireball", "lightning bolt"])
      }))
    }))
  }))
  default = {}
}

output "things" {
  value = var.things
}
