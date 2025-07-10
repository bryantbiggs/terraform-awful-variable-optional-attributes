module "thing" {
  source = "./modules/thing"

  for_each = var.things != null ? var.things : {}

  something      = coalesce(each.value.something, each.value.default_things.something)
  something_else = try(each.value.something_else, each.value.default_things.something_else, null)
}
