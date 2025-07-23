variable "nullable_create" {
  type    = bool
  default = null
}

variable "non_nullable_create" {
  type    = bool
  default = null
}

variable "nullable_thing" {
  type = object({
    some_bool_w_default   = optional(bool, true)
    some_string_w_default = optional(string, "default_value")
    some_bool             = optional(bool)
    some_string           = optional(string)
  })
  default = null
}

variable "non_nullable_thing" {
  type = object({
    some_bool_w_default   = optional(bool, true)
    some_string_w_default = optional(string, "default_value")
    some_bool             = optional(bool)
    some_string           = optional(string)
  })
  default = null
}

module "nullable" {
  source = "../modules/nullable"

  nullable_create     = var.nullable_create
  non_nullable_create = var.non_nullable_create
  nullable_thing      = var.nullable_thing
  non_nullable_thing  = var.non_nullable_thing
}

output "nullable_create" {
  value = module.nullable.nullable_create
}

output "non_nullable_create" {
  value = module.nullable.non_nullable_create
}

output "nullable_thing" {
  value = module.nullable.nullable_thing
}

output "non_nullable_thing" {
  value = module.nullable.non_nullable_thing
}
