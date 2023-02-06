# frozen_string_literal: true

class StaticController < ApplicationController
  def homepage
    @overtime_requests = Post.submitted

    @audit_logs = AuditLog.pending if current_user.admin?
  end
end
