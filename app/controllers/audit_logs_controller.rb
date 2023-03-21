# frozen_string_literal: true

class AuditLogsController < ApplicationController
  before_action :audit_log, only: :confirm

  def index
    authorize AuditLog

    @audit_logs = AuditLog.all.page(params[:page])
  end

  def confirm
    authorize audit_log

    audit_log.confirmed!

    redirect_to root_path, success: 'Your confirmation has successfully made!'
  end

  private

  def audit_log
    @audit_log ||= AuditLog.find(params.require(:id))
  end
end
