# frozen_string_literal: true

class PostPolicy < ApplicationPolicy
  def update?
    record.user_id == user.id || user.admin?
  end
end
