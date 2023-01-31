# frozen_string_literal: true

class PostPolicy < ApplicationPolicy
  def update?
    record.user_id == user.id || user.admin?
  end

  class Scope < Scope
    def resolve
      user.admin? ? scope.all : scope.post_by(user)
    end
  end
end
