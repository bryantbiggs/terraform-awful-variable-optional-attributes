variable "something" {
  description = "Its a thing - it does things, or it doesn't - I don't really know"
  type = object({
    cool = optional(bool, true)
    fancy = optional(object({
      wizard = optional(bool, true)
      magic  = optional(string, "abracadabra")
      spells = optional(list(string), ["fireball", "lightning bolt"])
    }))
  })
  default = null
}

variable "something_else" {
  description = "Another thing"
  type = object({
    cool = optional(bool, true)
    fancy = optional(object({
      wizard = optional(bool, true)
      magic  = optional(string, "abracadabra")
      spells = optional(list(string), ["fireball", "lightning bolt"])
    }))
  })
  default = {
    fance = {
      wizard = false
      magic  = "hocus pocus"
      spells = ["teleport", "invisibility"]
    }
  }
}
