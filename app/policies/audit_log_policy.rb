# frozen_string_literal: true

class AuditLogPolicy < ApplicationPolicy
  def index?
    user.admin?
  end
end
