variable "zero_trust_gateway_policies" {
  description = <<EOT
Map of zero_trust_gateway_policies, attributes below
Required:
    - account_id
    - action
    - name
Optional:
    - description
    - device_posture
    - enabled
    - expiration
    - filters
    - identity
    - precedence
    - rule_settings
    - schedule
    - traffic
EOT

  type = map(object({
    account_id     = string
    action         = string
    name           = string
    description    = optional(string)
    device_posture = optional(string)
    enabled        = optional(bool)
    expiration = optional(object({
      duration   = optional(number)
      expires_at = string
    }))
    filters    = optional(list(string))
    identity   = optional(string)
    precedence = optional(number)
    rule_settings = optional(object({
      add_headers        = optional(map(any))
      allow_child_bypass = optional(bool)
      audit_ssh = optional(object({
        command_logging = optional(bool)
      }))
      biso_admin_controls = optional(object({
        copy     = optional(string)
        dcp      = optional(bool)
        dd       = optional(bool)
        dk       = optional(bool)
        download = optional(string)
        dp       = optional(bool)
        du       = optional(bool)
        keyboard = optional(string)
        paste    = optional(string)
        printing = optional(string)
        upload   = optional(string)
        version  = optional(string)
        wm_id    = optional(string)
      }))
      block_page = optional(object({
        include_context = optional(bool)
        target_uri      = string
      }))
      block_page_enabled = optional(bool)
      block_reason       = optional(string)
      bypass_parent_rule = optional(bool)
      check_session = optional(object({
        duration = optional(string)
        enforce  = optional(bool)
      }))
      delete_headers = optional(list(string))
      dns_resolvers = optional(object({
        ipv4 = optional(list(object({
          ip                            = string
          port                          = optional(number)
          route_through_private_network = optional(bool)
          vnet_id                       = optional(string)
        })))
        ipv6 = optional(list(object({
          ip                            = string
          port                          = optional(number)
          route_through_private_network = optional(bool)
          vnet_id                       = optional(string)
        })))
      }))
      egress = optional(object({
        ipv4          = optional(string)
        ipv4_fallback = optional(string)
        ipv6          = optional(string)
      }))
      forensic_copy = optional(object({
        enabled = optional(bool)
      }))
      ignore_cname_category_matches      = optional(bool)
      insecure_disable_dnssec_validation = optional(bool)
      ip_categories                      = optional(bool)
      ip_indicator_feeds                 = optional(bool)
      l4override = optional(object({
        ip   = optional(string)
        port = optional(number)
      }))
      notification_settings = optional(object({
        enabled         = optional(bool)
        include_context = optional(bool)
        msg             = optional(string)
        support_url     = optional(string)
      }))
      override_host = optional(string)
      override_ips  = optional(list(string))
      payload_log = optional(object({
        enabled = optional(bool)
      }))
      quarantine = optional(object({
        file_types = optional(list(string))
      }))
      redirect = optional(object({
        include_context         = optional(bool)
        preserve_path_and_query = optional(bool)
        target_uri              = string
      }))
      resolve_dns_internally = optional(object({
        fallback = optional(string)
        view_id  = optional(string)
      }))
      resolve_dns_through_cloudflare = optional(bool)
      set_headers                    = optional(map(any))
      untrusted_cert = optional(object({
        action = optional(string)
      }))
    }))
    schedule = optional(object({
      fri       = optional(string)
      mon       = optional(string)
      sat       = optional(string)
      sun       = optional(string)
      thu       = optional(string)
      time_zone = optional(string)
      tue       = optional(string)
      wed       = optional(string)
    }))
    traffic = optional(string)
  }))
}

