# frozen_string_literal: true

class AuditLogPolicy < ApplicationPolicy
  def index?
    user.admin?
  end

  def confirm?
    !user.admin?
  end
end
