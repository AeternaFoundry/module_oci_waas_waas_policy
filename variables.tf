variable "waas_waas_policies" {
  description = <<EOT
Map of waas_waas_policies, attributes below
Required:
    - compartment_id
    - domain
Optional:
    - additional_domains
    - defined_tags
    - display_name
    - freeform_tags
    - origin_groups (block):
        - label (required)
        - origin_group (required, block):
            - origin (required)
            - weight (optional)
    - origins (block):
        - custom_headers (optional, block):
            - name (required)
            - value (required)
        - http_port (optional)
        - https_port (optional)
        - label (required)
        - uri (required)
    - policy_config (block):
        - certificate_id (optional)
        - cipher_group (optional)
        - client_address_header (optional)
        - health_checks (optional, block):
            - expected_response_code_group (optional)
            - expected_response_text (optional)
            - headers (optional)
            - healthy_threshold (optional)
            - interval_in_seconds (optional)
            - is_enabled (optional)
            - is_response_text_check_enabled (optional)
            - method (optional)
            - path (optional)
            - timeout_in_seconds (optional)
            - unhealthy_threshold (optional)
        - is_behind_cdn (optional)
        - is_cache_control_respected (optional)
        - is_https_enabled (optional)
        - is_https_forced (optional)
        - is_origin_compression_enabled (optional)
        - is_response_buffering_enabled (optional)
        - is_sni_enabled (optional)
        - load_balancing_method (optional, block):
            - domain (optional)
            - expiration_time_in_seconds (optional)
            - method (required)
            - name (optional)
        - tls_protocols (optional)
        - websocket_path_prefixes (optional)
    - timeouts (block):
        - create (optional)
        - delete (optional)
        - update (optional)
    - waf_config (block):
        - access_rules (optional, block):
            - action (required)
            - block_action (optional)
            - block_error_page_code (optional)
            - block_error_page_description (optional)
            - block_error_page_message (optional)
            - block_response_code (optional)
            - bypass_challenges (optional)
            - captcha_footer (optional)
            - captcha_header (optional)
            - captcha_submit_label (optional)
            - captcha_title (optional)
            - criteria (required, block):
                - condition (required)
                - is_case_sensitive (optional)
                - value (required)
            - name (required)
            - redirect_response_code (optional)
            - redirect_url (optional)
            - response_header_manipulation (optional, block):
                - action (required)
                - header (required)
                - value (optional)
        - address_rate_limiting (optional, block):
            - allowed_rate_per_address (optional)
            - block_response_code (optional)
            - is_enabled (required)
            - max_delayed_count_per_address (optional)
        - caching_rules (optional, block):
            - action (required)
            - caching_duration (optional)
            - client_caching_duration (optional)
            - criteria (required, block):
                - condition (required)
                - value (required)
            - is_client_caching_enabled (optional)
            - key (optional)
            - name (required)
        - captchas (optional, block):
            - failure_message (required)
            - footer_text (optional)
            - header_text (optional)
            - session_expiration_in_seconds (required)
            - submit_label (required)
            - title (required)
            - url (required)
        - custom_protection_rules (optional, block):
            - action (optional)
            - exclusions (optional, block):
                - exclusions (optional)
                - target (optional)
            - id (optional)
        - device_fingerprint_challenge (optional, block):
            - action (optional)
            - action_expiration_in_seconds (optional)
            - challenge_settings (optional, block):
                - block_action (optional)
                - block_error_page_code (optional)
                - block_error_page_description (optional)
                - block_error_page_message (optional)
                - block_response_code (optional)
                - captcha_footer (optional)
                - captcha_header (optional)
                - captcha_submit_label (optional)
                - captcha_title (optional)
            - failure_threshold (optional)
            - failure_threshold_expiration_in_seconds (optional)
            - is_enabled (required)
            - max_address_count (optional)
            - max_address_count_expiration_in_seconds (optional)
        - human_interaction_challenge (optional, block):
            - action (optional)
            - action_expiration_in_seconds (optional)
            - challenge_settings (optional, block):
                - block_action (optional)
                - block_error_page_code (optional)
                - block_error_page_description (optional)
                - block_error_page_message (optional)
                - block_response_code (optional)
                - captcha_footer (optional)
                - captcha_header (optional)
                - captcha_submit_label (optional)
                - captcha_title (optional)
            - failure_threshold (optional)
            - failure_threshold_expiration_in_seconds (optional)
            - interaction_threshold (optional)
            - is_enabled (required)
            - is_nat_enabled (optional)
            - recording_period_in_seconds (optional)
            - set_http_header (optional, block):
                - name (required)
                - value (required)
        - js_challenge (optional, block):
            - action (optional)
            - action_expiration_in_seconds (optional)
            - are_redirects_challenged (optional)
            - challenge_settings (optional, block):
                - block_action (optional)
                - block_error_page_code (optional)
                - block_error_page_description (optional)
                - block_error_page_message (optional)
                - block_response_code (optional)
                - captcha_footer (optional)
                - captcha_header (optional)
                - captcha_submit_label (optional)
                - captcha_title (optional)
            - criteria (optional, block):
                - condition (required)
                - is_case_sensitive (optional)
                - value (required)
            - failure_threshold (optional)
            - is_enabled (required)
            - is_nat_enabled (optional)
            - set_http_header (optional, block):
                - name (required)
                - value (required)
        - origin (optional)
        - origin_groups (optional)
        - protection_settings (optional, block):
            - allowed_http_methods (optional)
            - block_action (optional)
            - block_error_page_code (optional)
            - block_error_page_description (optional)
            - block_error_page_message (optional)
            - block_response_code (optional)
            - is_response_inspected (optional)
            - max_argument_count (optional)
            - max_name_length_per_argument (optional)
            - max_response_size_in_ki_b (optional)
            - max_total_name_length_of_arguments (optional)
            - media_types (optional)
            - recommendations_period_in_days (optional)
        - whitelists (optional, block):
            - address_lists (optional)
            - addresses (optional)
            - name (required)
EOT

  type = map(object({
    compartment_id     = string
    domain             = string
    additional_domains = optional(list(string))
    defined_tags       = optional(map(string))
    display_name       = optional(string)
    freeform_tags      = optional(map(string))
    origin_groups = optional(list(object({
      label = string
      origin_group = list(object({
        origin = string
        weight = optional(number)
      }))
    })))
    origins = optional(list(object({
      custom_headers = optional(list(object({
        name  = string
        value = string
      })))
      http_port  = optional(number)
      https_port = optional(number)
      label      = string
      uri        = string
    })))
    policy_config = optional(object({
      certificate_id        = optional(string)
      cipher_group          = optional(string)
      client_address_header = optional(string)
      health_checks = optional(object({
        expected_response_code_group   = optional(list(string))
        expected_response_text         = optional(string)
        headers                        = optional(map(string))
        healthy_threshold              = optional(number)
        interval_in_seconds            = optional(number)
        is_enabled                     = optional(bool)
        is_response_text_check_enabled = optional(bool)
        method                         = optional(string)
        path                           = optional(string)
        timeout_in_seconds             = optional(number)
        unhealthy_threshold            = optional(number)
      }))
      is_behind_cdn                 = optional(bool)
      is_cache_control_respected    = optional(bool)
      is_https_enabled              = optional(bool)
      is_https_forced               = optional(bool)
      is_origin_compression_enabled = optional(bool)
      is_response_buffering_enabled = optional(bool)
      is_sni_enabled                = optional(bool)
      load_balancing_method = optional(object({
        domain                     = optional(string)
        expiration_time_in_seconds = optional(number)
        method                     = string
        name                       = optional(string)
      }))
      tls_protocols           = optional(list(string))
      websocket_path_prefixes = optional(list(string))
    }))
    timeouts = optional(object({
      create = optional(string)
      delete = optional(string)
      update = optional(string)
    }))
    waf_config = optional(object({
      access_rules = optional(list(object({
        action                       = string
        block_action                 = optional(string)
        block_error_page_code        = optional(string)
        block_error_page_description = optional(string)
        block_error_page_message     = optional(string)
        block_response_code          = optional(number)
        bypass_challenges            = optional(list(string))
        captcha_footer               = optional(string)
        captcha_header               = optional(string)
        captcha_submit_label         = optional(string)
        captcha_title                = optional(string)
        criteria = list(object({
          condition         = string
          is_case_sensitive = optional(bool)
          value             = string
        }))
        name                   = string
        redirect_response_code = optional(string)
        redirect_url           = optional(string)
        response_header_manipulation = optional(list(object({
          action = string
          header = string
          value  = optional(string)
        })))
      })))
      address_rate_limiting = optional(object({
        allowed_rate_per_address      = optional(number)
        block_response_code           = optional(number)
        is_enabled                    = bool
        max_delayed_count_per_address = optional(number)
      }))
      caching_rules = optional(list(object({
        action                  = string
        caching_duration        = optional(string)
        client_caching_duration = optional(string)
        criteria = list(object({
          condition = string
          value     = string
        }))
        is_client_caching_enabled = optional(bool)
        key                       = optional(string)
        name                      = string
      })))
      captchas = optional(list(object({
        failure_message               = string
        footer_text                   = optional(string)
        header_text                   = optional(string)
        session_expiration_in_seconds = number
        submit_label                  = string
        title                         = string
        url                           = string
      })))
      custom_protection_rules = optional(list(object({
        action = optional(string)
        exclusions = optional(list(object({
          exclusions = optional(list(string))
          target     = optional(string)
        })))
        id = optional(string)
      })))
      device_fingerprint_challenge = optional(object({
        action                       = optional(string)
        action_expiration_in_seconds = optional(number)
        challenge_settings = optional(object({
          block_action                 = optional(string)
          block_error_page_code        = optional(string)
          block_error_page_description = optional(string)
          block_error_page_message     = optional(string)
          block_response_code          = optional(number)
          captcha_footer               = optional(string)
          captcha_header               = optional(string)
          captcha_submit_label         = optional(string)
          captcha_title                = optional(string)
        }))
        failure_threshold                       = optional(number)
        failure_threshold_expiration_in_seconds = optional(number)
        is_enabled                              = bool
        max_address_count                       = optional(number)
        max_address_count_expiration_in_seconds = optional(number)
      }))
      human_interaction_challenge = optional(object({
        action                       = optional(string)
        action_expiration_in_seconds = optional(number)
        challenge_settings = optional(object({
          block_action                 = optional(string)
          block_error_page_code        = optional(string)
          block_error_page_description = optional(string)
          block_error_page_message     = optional(string)
          block_response_code          = optional(number)
          captcha_footer               = optional(string)
          captcha_header               = optional(string)
          captcha_submit_label         = optional(string)
          captcha_title                = optional(string)
        }))
        failure_threshold                       = optional(number)
        failure_threshold_expiration_in_seconds = optional(number)
        interaction_threshold                   = optional(number)
        is_enabled                              = bool
        is_nat_enabled                          = optional(bool)
        recording_period_in_seconds             = optional(number)
        set_http_header = optional(object({
          name  = string
          value = string
        }))
      }))
      js_challenge = optional(object({
        action                       = optional(string)
        action_expiration_in_seconds = optional(number)
        are_redirects_challenged     = optional(bool)
        challenge_settings = optional(object({
          block_action                 = optional(string)
          block_error_page_code        = optional(string)
          block_error_page_description = optional(string)
          block_error_page_message     = optional(string)
          block_response_code          = optional(number)
          captcha_footer               = optional(string)
          captcha_header               = optional(string)
          captcha_submit_label         = optional(string)
          captcha_title                = optional(string)
        }))
        criteria = optional(list(object({
          condition         = string
          is_case_sensitive = optional(bool)
          value             = string
        })))
        failure_threshold = optional(number)
        is_enabled        = bool
        is_nat_enabled    = optional(bool)
        set_http_header = optional(object({
          name  = string
          value = string
        }))
      }))
      origin        = optional(string)
      origin_groups = optional(list(string))
      protection_settings = optional(object({
        allowed_http_methods               = optional(list(string))
        block_action                       = optional(string)
        block_error_page_code              = optional(string)
        block_error_page_description       = optional(string)
        block_error_page_message           = optional(string)
        block_response_code                = optional(number)
        is_response_inspected              = optional(bool)
        max_argument_count                 = optional(number)
        max_name_length_per_argument       = optional(number)
        max_response_size_in_ki_b          = optional(number)
        max_total_name_length_of_arguments = optional(number)
        media_types                        = optional(list(string))
        recommendations_period_in_days     = optional(number)
      }))
      whitelists = optional(list(object({
        address_lists = optional(list(string))
        addresses     = optional(list(string))
        name          = string
      })))
    }))
  }))
  validation {
    condition = alltrue([
      for k, v in var.waas_waas_policies : (
        v.origin_groups == null || alltrue([for item in v.origin_groups : (length(item.origin_group) >= 1)])
      )
    ])
    error_message = "Each origin_group list must contain at least 1 items"
  }
  validation {
    condition = alltrue([
      for k, v in var.waas_waas_policies : (
        v.waf_config == null || (v.waf_config.access_rules == null || alltrue([for item in v.waf_config.access_rules : (length(item.criteria) >= 1)]))
      )
    ])
    error_message = "Each criteria list must contain at least 1 items"
  }
  validation {
    condition = alltrue([
      for k, v in var.waas_waas_policies : (
        v.waf_config == null || (v.waf_config.caching_rules == null || alltrue([for item in v.waf_config.caching_rules : (length(item.criteria) >= 1)]))
      )
    ])
    error_message = "Each criteria list must contain at least 1 items"
  }
  validation {
    condition = alltrue([
      for k, v in var.waas_waas_policies : (
        v.policy_config == null || (v.policy_config.load_balancing_method == null || (contains([for v in ["IP_HASH", "ROUND_ROBIN", "STICKY_COOKIE"] : lower(v)], lower(v.policy_config.load_balancing_method.method))))
      )
    ])
    error_message = "must be one of: \"IP_HASH\", \"ROUND_ROBIN\", \"STICKY_COOKIE\""
  }
  validation {
    condition = alltrue([
      for k, v in var.waas_waas_policies : (
        v.waf_config == null || (v.waf_config.access_rules == null || alltrue([for item in v.waf_config.access_rules : (item.response_header_manipulation == null || alltrue([for item in item.response_header_manipulation : (contains([for v in ["ADD_HTTP_RESPONSE_HEADER", "EXTEND_HTTP_RESPONSE_HEADER", "REMOVE_HTTP_RESPONSE_HEADER"] : lower(v)], lower(item.action)))]))]))
      )
    ])
    error_message = "must be one of: \"ADD_HTTP_RESPONSE_HEADER\", \"EXTEND_HTTP_RESPONSE_HEADER\", \"REMOVE_HTTP_RESPONSE_HEADER\""
  }
}

