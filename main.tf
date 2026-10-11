resource "cloudflare_zero_trust_gateway_policy" "zero_trust_gateway_policies" {
  for_each = var.zero_trust_gateway_policies

  account_id     = each.value.account_id
  action         = each.value.action
  name           = each.value.name
  description    = each.value.description
  device_posture = each.value.device_posture
  enabled        = each.value.enabled
  expiration     = each.value.expiration
  filters        = each.value.filters
  identity       = each.value.identity
  precedence     = each.value.precedence
  rule_settings  = each.value.rule_settings
  schedule       = each.value.schedule
  traffic        = each.value.traffic
}

