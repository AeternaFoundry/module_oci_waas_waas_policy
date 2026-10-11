resource "oci_waas_waas_policy" "waas_waas_policies" {
  for_each = var.waas_waas_policies

  compartment_id     = each.value.compartment_id
  domain             = each.value.domain
  additional_domains = each.value.additional_domains
  defined_tags       = each.value.defined_tags
  display_name       = each.value.display_name
  freeform_tags      = each.value.freeform_tags

  dynamic "origin_groups" {
    for_each = each.value.origin_groups != null ? each.value.origin_groups : []
    content {
      label = origin_groups.value.label
      dynamic "origin_group" {
        for_each = origin_groups.value.origin_group
        content {
          origin = origin_group.value.origin
          weight = origin_group.value.weight
        }
      }
    }
  }

  dynamic "origins" {
    for_each = each.value.origins != null ? each.value.origins : []
    content {
      dynamic "custom_headers" {
        for_each = origins.value.custom_headers != null ? origins.value.custom_headers : []
        content {
          name  = custom_headers.value.name
          value = custom_headers.value.value
        }
      }
      http_port  = origins.value.http_port
      https_port = origins.value.https_port
      label      = origins.value.label
      uri        = origins.value.uri
    }
  }

  dynamic "policy_config" {
    for_each = each.value.policy_config != null ? [each.value.policy_config] : []
    content {
      certificate_id        = policy_config.value.certificate_id
      cipher_group          = policy_config.value.cipher_group
      client_address_header = policy_config.value.client_address_header
      dynamic "health_checks" {
        for_each = policy_config.value.health_checks != null ? [policy_config.value.health_checks] : []
        content {
          expected_response_code_group   = health_checks.value.expected_response_code_group
          expected_response_text         = health_checks.value.expected_response_text
          headers                        = health_checks.value.headers
          healthy_threshold              = health_checks.value.healthy_threshold
          interval_in_seconds            = health_checks.value.interval_in_seconds
          is_enabled                     = health_checks.value.is_enabled
          is_response_text_check_enabled = health_checks.value.is_response_text_check_enabled
          method                         = health_checks.value.method
          path                           = health_checks.value.path
          timeout_in_seconds             = health_checks.value.timeout_in_seconds
          unhealthy_threshold            = health_checks.value.unhealthy_threshold
        }
      }
      is_behind_cdn                 = policy_config.value.is_behind_cdn
      is_cache_control_respected    = policy_config.value.is_cache_control_respected
      is_https_enabled              = policy_config.value.is_https_enabled
      is_https_forced               = policy_config.value.is_https_forced
      is_origin_compression_enabled = policy_config.value.is_origin_compression_enabled
      is_response_buffering_enabled = policy_config.value.is_response_buffering_enabled
      is_sni_enabled                = policy_config.value.is_sni_enabled
      dynamic "load_balancing_method" {
        for_each = policy_config.value.load_balancing_method != null ? [policy_config.value.load_balancing_method] : []
        content {
          domain                     = load_balancing_method.value.domain
          expiration_time_in_seconds = load_balancing_method.value.expiration_time_in_seconds
          method                     = load_balancing_method.value.method
          name                       = load_balancing_method.value.name
        }
      }
      tls_protocols           = policy_config.value.tls_protocols
      websocket_path_prefixes = policy_config.value.websocket_path_prefixes
    }
  }

  dynamic "timeouts" {
    for_each = each.value.timeouts != null ? [each.value.timeouts] : []
    content {
      create = timeouts.value.create
      delete = timeouts.value.delete
      update = timeouts.value.update
    }
  }

  dynamic "waf_config" {
    for_each = each.value.waf_config != null ? [each.value.waf_config] : []
    content {
      dynamic "access_rules" {
        for_each = waf_config.value.access_rules != null ? waf_config.value.access_rules : []
        content {
          action                       = access_rules.value.action
          block_action                 = access_rules.value.block_action
          block_error_page_code        = access_rules.value.block_error_page_code
          block_error_page_description = access_rules.value.block_error_page_description
          block_error_page_message     = access_rules.value.block_error_page_message
          block_response_code          = access_rules.value.block_response_code
          bypass_challenges            = access_rules.value.bypass_challenges
          captcha_footer               = access_rules.value.captcha_footer
          captcha_header               = access_rules.value.captcha_header
          captcha_submit_label         = access_rules.value.captcha_submit_label
          captcha_title                = access_rules.value.captcha_title
          dynamic "criteria" {
            for_each = access_rules.value.criteria
            content {
              condition         = criteria.value.condition
              is_case_sensitive = criteria.value.is_case_sensitive
              value             = criteria.value.value
            }
          }
          name                   = access_rules.value.name
          redirect_response_code = access_rules.value.redirect_response_code
          redirect_url           = access_rules.value.redirect_url
          dynamic "response_header_manipulation" {
            for_each = access_rules.value.response_header_manipulation != null ? access_rules.value.response_header_manipulation : []
            content {
              action = response_header_manipulation.value.action
              header = response_header_manipulation.value.header
              value  = response_header_manipulation.value.value
            }
          }
        }
      }
      dynamic "address_rate_limiting" {
        for_each = waf_config.value.address_rate_limiting != null ? [waf_config.value.address_rate_limiting] : []
        content {
          allowed_rate_per_address      = address_rate_limiting.value.allowed_rate_per_address
          block_response_code           = address_rate_limiting.value.block_response_code
          is_enabled                    = address_rate_limiting.value.is_enabled
          max_delayed_count_per_address = address_rate_limiting.value.max_delayed_count_per_address
        }
      }
      dynamic "caching_rules" {
        for_each = waf_config.value.caching_rules != null ? waf_config.value.caching_rules : []
        content {
          action                  = caching_rules.value.action
          caching_duration        = caching_rules.value.caching_duration
          client_caching_duration = caching_rules.value.client_caching_duration
          dynamic "criteria" {
            for_each = caching_rules.value.criteria
            content {
              condition = criteria.value.condition
              value     = criteria.value.value
            }
          }
          is_client_caching_enabled = caching_rules.value.is_client_caching_enabled
          key                       = caching_rules.value.key
          name                      = caching_rules.value.name
        }
      }
      dynamic "captchas" {
        for_each = waf_config.value.captchas != null ? waf_config.value.captchas : []
        content {
          failure_message               = captchas.value.failure_message
          footer_text                   = captchas.value.footer_text
          header_text                   = captchas.value.header_text
          session_expiration_in_seconds = captchas.value.session_expiration_in_seconds
          submit_label                  = captchas.value.submit_label
          title                         = captchas.value.title
          url                           = captchas.value.url
        }
      }
      dynamic "custom_protection_rules" {
        for_each = waf_config.value.custom_protection_rules != null ? waf_config.value.custom_protection_rules : []
        content {
          action = custom_protection_rules.value.action
          dynamic "exclusions" {
            for_each = custom_protection_rules.value.exclusions != null ? custom_protection_rules.value.exclusions : []
            content {
              exclusions = exclusions.value.exclusions
              target     = exclusions.value.target
            }
          }
          id = custom_protection_rules.value.id
        }
      }
      dynamic "device_fingerprint_challenge" {
        for_each = waf_config.value.device_fingerprint_challenge != null ? [waf_config.value.device_fingerprint_challenge] : []
        content {
          action                       = device_fingerprint_challenge.value.action
          action_expiration_in_seconds = device_fingerprint_challenge.value.action_expiration_in_seconds
          dynamic "challenge_settings" {
            for_each = device_fingerprint_challenge.value.challenge_settings != null ? [device_fingerprint_challenge.value.challenge_settings] : []
            content {
              block_action                 = challenge_settings.value.block_action
              block_error_page_code        = challenge_settings.value.block_error_page_code
              block_error_page_description = challenge_settings.value.block_error_page_description
              block_error_page_message     = challenge_settings.value.block_error_page_message
              block_response_code          = challenge_settings.value.block_response_code
              captcha_footer               = challenge_settings.value.captcha_footer
              captcha_header               = challenge_settings.value.captcha_header
              captcha_submit_label         = challenge_settings.value.captcha_submit_label
              captcha_title                = challenge_settings.value.captcha_title
            }
          }
          failure_threshold                       = device_fingerprint_challenge.value.failure_threshold
          failure_threshold_expiration_in_seconds = device_fingerprint_challenge.value.failure_threshold_expiration_in_seconds
          is_enabled                              = device_fingerprint_challenge.value.is_enabled
          max_address_count                       = device_fingerprint_challenge.value.max_address_count
          max_address_count_expiration_in_seconds = device_fingerprint_challenge.value.max_address_count_expiration_in_seconds
        }
      }
      dynamic "human_interaction_challenge" {
        for_each = waf_config.value.human_interaction_challenge != null ? [waf_config.value.human_interaction_challenge] : []
        content {
          action                       = human_interaction_challenge.value.action
          action_expiration_in_seconds = human_interaction_challenge.value.action_expiration_in_seconds
          dynamic "challenge_settings" {
            for_each = human_interaction_challenge.value.challenge_settings != null ? [human_interaction_challenge.value.challenge_settings] : []
            content {
              block_action                 = challenge_settings.value.block_action
              block_error_page_code        = challenge_settings.value.block_error_page_code
              block_error_page_description = challenge_settings.value.block_error_page_description
              block_error_page_message     = challenge_settings.value.block_error_page_message
              block_response_code          = challenge_settings.value.block_response_code
              captcha_footer               = challenge_settings.value.captcha_footer
              captcha_header               = challenge_settings.value.captcha_header
              captcha_submit_label         = challenge_settings.value.captcha_submit_label
              captcha_title                = challenge_settings.value.captcha_title
            }
          }
          failure_threshold                       = human_interaction_challenge.value.failure_threshold
          failure_threshold_expiration_in_seconds = human_interaction_challenge.value.failure_threshold_expiration_in_seconds
          interaction_threshold                   = human_interaction_challenge.value.interaction_threshold
          is_enabled                              = human_interaction_challenge.value.is_enabled
          is_nat_enabled                          = human_interaction_challenge.value.is_nat_enabled
          recording_period_in_seconds             = human_interaction_challenge.value.recording_period_in_seconds
          dynamic "set_http_header" {
            for_each = human_interaction_challenge.value.set_http_header != null ? [human_interaction_challenge.value.set_http_header] : []
            content {
              name  = set_http_header.value.name
              value = set_http_header.value.value
            }
          }
        }
      }
      dynamic "js_challenge" {
        for_each = waf_config.value.js_challenge != null ? [waf_config.value.js_challenge] : []
        content {
          action                       = js_challenge.value.action
          action_expiration_in_seconds = js_challenge.value.action_expiration_in_seconds
          are_redirects_challenged     = js_challenge.value.are_redirects_challenged
          dynamic "challenge_settings" {
            for_each = js_challenge.value.challenge_settings != null ? [js_challenge.value.challenge_settings] : []
            content {
              block_action                 = challenge_settings.value.block_action
              block_error_page_code        = challenge_settings.value.block_error_page_code
              block_error_page_description = challenge_settings.value.block_error_page_description
              block_error_page_message     = challenge_settings.value.block_error_page_message
              block_response_code          = challenge_settings.value.block_response_code
              captcha_footer               = challenge_settings.value.captcha_footer
              captcha_header               = challenge_settings.value.captcha_header
              captcha_submit_label         = challenge_settings.value.captcha_submit_label
              captcha_title                = challenge_settings.value.captcha_title
            }
          }
          dynamic "criteria" {
            for_each = js_challenge.value.criteria != null ? js_challenge.value.criteria : []
            content {
              condition         = criteria.value.condition
              is_case_sensitive = criteria.value.is_case_sensitive
              value             = criteria.value.value
            }
          }
          failure_threshold = js_challenge.value.failure_threshold
          is_enabled        = js_challenge.value.is_enabled
          is_nat_enabled    = js_challenge.value.is_nat_enabled
          dynamic "set_http_header" {
            for_each = js_challenge.value.set_http_header != null ? [js_challenge.value.set_http_header] : []
            content {
              name  = set_http_header.value.name
              value = set_http_header.value.value
            }
          }
        }
      }
      origin        = waf_config.value.origin
      origin_groups = waf_config.value.origin_groups
      dynamic "protection_settings" {
        for_each = waf_config.value.protection_settings != null ? [waf_config.value.protection_settings] : []
        content {
          allowed_http_methods               = protection_settings.value.allowed_http_methods
          block_action                       = protection_settings.value.block_action
          block_error_page_code              = protection_settings.value.block_error_page_code
          block_error_page_description       = protection_settings.value.block_error_page_description
          block_error_page_message           = protection_settings.value.block_error_page_message
          block_response_code                = protection_settings.value.block_response_code
          is_response_inspected              = protection_settings.value.is_response_inspected
          max_argument_count                 = protection_settings.value.max_argument_count
          max_name_length_per_argument       = protection_settings.value.max_name_length_per_argument
          max_response_size_in_ki_b          = protection_settings.value.max_response_size_in_ki_b
          max_total_name_length_of_arguments = protection_settings.value.max_total_name_length_of_arguments
          media_types                        = protection_settings.value.media_types
          recommendations_period_in_days     = protection_settings.value.recommendations_period_in_days
        }
      }
      dynamic "whitelists" {
        for_each = waf_config.value.whitelists != null ? waf_config.value.whitelists : []
        content {
          address_lists = whitelists.value.address_lists
          addresses     = whitelists.value.addresses
          name          = whitelists.value.name
        }
      }
    }
  }
}

