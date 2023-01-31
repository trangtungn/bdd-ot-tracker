# frozen_string_literal: true

module UsersHelper
  delegate :admin?, to: :current_user
  delegate :full_name, to: :current_user

  def logged_in?
    current_user.present?
  end
end
