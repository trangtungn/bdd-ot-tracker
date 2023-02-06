# frozen_string_literal: true

class PostPolicy < ApplicationPolicy
  def update?
    (record.user_id == user.id && !record.approved?) || user.admin?
  end

  def approve?
    user.admin?
  end

  class Scope < Scope
    def resolve
      user.admin? ? scope.all : scope.post_by(user)
    end
  end
end
