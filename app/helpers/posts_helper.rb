# frozen_string_literal: true

module PostsHelper
  COLOR_MAPPER = {
    'approved' => 'success',
    'submitted' => 'primary',
    'rejected' => 'secondary'
  }.freeze

  def validate(post)
    return unless post.errors.any?

    output = []

    post.errors.full_messages.each do |message|
      output << "toastr.error(\"#{message}\");"
    end

    output.join(' ')
  end

  def status_span(status)
    content_tag(:span, status.titleize, class: "badge bg-#{COLOR_MAPPER[status]}")
  end
end
