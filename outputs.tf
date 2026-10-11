output "waas_waas_policies_id" {
  description = "Map of id values across all waas_waas_policies, keyed the same as var.waas_waas_policies except keys with no id are omitted"
  value       = { for k, v in oci_waas_waas_policy.waas_waas_policies : k => v.id if v.id != null && length(v.id) > 0 }
}
output "waas_waas_policies_additional_domains" {
  description = "Map of additional_domains values across all waas_waas_policies, keyed the same as var.waas_waas_policies except keys with no additional_domains are omitted"
  value       = { for k, v in oci_waas_waas_policy.waas_waas_policies : k => v.additional_domains if v.additional_domains != null && length(v.additional_domains) > 0 }
}
output "waas_waas_policies_cname" {
  description = "Map of cname values across all waas_waas_policies, keyed the same as var.waas_waas_policies except keys with no cname are omitted"
  value       = { for k, v in oci_waas_waas_policy.waas_waas_policies : k => v.cname if v.cname != null && length(v.cname) > 0 }
}
output "waas_waas_policies_compartment_id" {
  description = "Map of compartment_id values across all waas_waas_policies, keyed the same as var.waas_waas_policies except keys with no compartment_id are omitted"
  value       = { for k, v in oci_waas_waas_policy.waas_waas_policies : k => v.compartment_id if v.compartment_id != null && length(v.compartment_id) > 0 }
}
output "waas_waas_policies_defined_tags" {
  description = "Map of defined_tags values across all waas_waas_policies, keyed the same as var.waas_waas_policies except keys with no defined_tags are omitted"
  value       = { for k, v in oci_waas_waas_policy.waas_waas_policies : k => v.defined_tags if v.defined_tags != null && length(v.defined_tags) > 0 }
}
output "waas_waas_policies_display_name" {
  description = "Map of display_name values across all waas_waas_policies, keyed the same as var.waas_waas_policies except keys with no display_name are omitted"
  value       = { for k, v in oci_waas_waas_policy.waas_waas_policies : k => v.display_name if v.display_name != null && length(v.display_name) > 0 }
}
output "waas_waas_policies_domain" {
  description = "Map of domain values across all waas_waas_policies, keyed the same as var.waas_waas_policies except keys with no domain are omitted"
  value       = { for k, v in oci_waas_waas_policy.waas_waas_policies : k => v.domain if v.domain != null && length(v.domain) > 0 }
}
output "waas_waas_policies_freeform_tags" {
  description = "Map of freeform_tags values across all waas_waas_policies, keyed the same as var.waas_waas_policies except keys with no freeform_tags are omitted"
  value       = { for k, v in oci_waas_waas_policy.waas_waas_policies : k => v.freeform_tags if v.freeform_tags != null && length(v.freeform_tags) > 0 }
}
output "waas_waas_policies_origin_groups" {
  description = "Map of origin_groups values across all waas_waas_policies, keyed the same as var.waas_waas_policies except keys with no origin_groups are omitted"
  value       = { for k, v in oci_waas_waas_policy.waas_waas_policies : k => v.origin_groups if v.origin_groups != null && length(v.origin_groups) > 0 }
}
output "waas_waas_policies_origins" {
  description = "Map of origins values across all waas_waas_policies, keyed the same as var.waas_waas_policies except keys with no origins are omitted"
  value       = { for k, v in oci_waas_waas_policy.waas_waas_policies : k => v.origins if v.origins != null && length(v.origins) > 0 }
}
output "waas_waas_policies_policy_config" {
  description = "Map of policy_config values across all waas_waas_policies, keyed the same as var.waas_waas_policies except keys with no policy_config are omitted"
  value       = { for k, v in oci_waas_waas_policy.waas_waas_policies : k => one(v.policy_config) if v.policy_config != null && length(v.policy_config) > 0 }
}
output "waas_waas_policies_state" {
  description = "Map of state values across all waas_waas_policies, keyed the same as var.waas_waas_policies except keys with no state are omitted"
  value       = { for k, v in oci_waas_waas_policy.waas_waas_policies : k => v.state if v.state != null && length(v.state) > 0 }
}
output "waas_waas_policies_time_created" {
  description = "Map of time_created values across all waas_waas_policies, keyed the same as var.waas_waas_policies except keys with no time_created are omitted"
  value       = { for k, v in oci_waas_waas_policy.waas_waas_policies : k => v.time_created if v.time_created != null && length(v.time_created) > 0 }
}
output "waas_waas_policies_waf_config" {
  description = "Map of waf_config values across all waas_waas_policies, keyed the same as var.waas_waas_policies except keys with no waf_config are omitted"
  value       = { for k, v in oci_waas_waas_policy.waas_waas_policies : k => one(v.waf_config) if v.waf_config != null && length(v.waf_config) > 0 }
}

