# frozen_string_literal: true

module PostsHelper
  POST_COLOR_MAPPER = {
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

  def post_status_span(status)
    content_tag(:span, status.titleize, class: "badge bg-#{POST_COLOR_MAPPER[status]}")
  end
end
