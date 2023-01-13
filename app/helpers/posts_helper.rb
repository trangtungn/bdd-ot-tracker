# frozen_string_literal: true

module PostsHelper
  def validate(post)
    return unless post.errors.any?

    output = []

    post.errors.full_messages.each do |message|
      output << "toastr.error(\"#{message}\");"
    end

    output.join(' ')
  end
end
