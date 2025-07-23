variable "nullable_create" {
  type    = bool
  default = true
}

variable "non_nullable_create" {
  type     = bool
  default  = true
  nullable = false
}

variable "nullable_thing" {
  type = object({
    some_bool_w_default   = optional(bool, true)
    some_string_w_default = optional(string, "default_value")
    some_bool             = optional(bool)
    some_string           = optional(string)
  })
  default = {}
}

variable "non_nullable_thing" {
  type = object({
    some_bool_w_default   = optional(bool, true)
    some_string_w_default = optional(string, "default_value")
    some_bool             = optional(bool)
    some_string           = optional(string)
  })
  default  = {}
  nullable = false
}

#############################################################

output "nullable_create" {
  value = var.nullable_create
}

output "non_nullable_create" {
  value = var.non_nullable_create
}

output "nullable_thing" {
  value = var.nullable_thing
}

output "non_nullable_thing" {
  value = var.non_nullable_thing
}
