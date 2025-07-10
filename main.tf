module "thing" {
  source = "./modules/thing"

  for_each = var.things != null ? var.things : {}

  something      = try(each.value.something, each.value.default_things.something, null)
  something_else = try(each.value.something_else, each.value.default_things.something_else, null)
}
