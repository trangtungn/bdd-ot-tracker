# frozen_string_literal: true

module AuditLogsHelper
  AUDIT_LOG_COLOR_MAPPER = {
    'pending' => 'secondary',
    'confirmed' => 'primary'
  }.freeze

  def audit_log_status_span(status)
    content_tag(:span, status.titleize, class: "badge bg-#{AUDIT_LOG_COLOR_MAPPER[status]}")
  end
end
