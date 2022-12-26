# frozen_string_literal: true

module ApplicationHelper
  def active?(path)
    'active' if current_page?(path)
  end

  def error_field?(resource, field)
    resource.errors[field].present?
  end

  def error_messages(resource, field)
    resource.errors[field].map { |msg| msg }
  end
end
