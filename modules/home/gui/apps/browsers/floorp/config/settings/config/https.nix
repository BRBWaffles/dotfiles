{
  # HTTPS (SSL/TLS / OCSP / CERTS / HPKP)
  "security.ssl.require_safe_negotiation" = true;
  "security.tls.enable_0rtt_data" = false;
  "security.OCSP.enabled" = 1;
  "security.OCSP.require" = true;
  "security.cert_pinning.enforcement_level" = 2;
  "security.remote_settings.crlite_filters.enabled" = true;
  "security.pki.crlite_mode" = 2;
  "dom.security.https_only_mode" = true;
  "dom.security.https_only_mode_send_http_background_request" = false;
  "security.ssl.treat_unsafe_negotiation_as_broken" = true;
  "browser.xul.error_pages.expert_bad_cert" = true;
}
