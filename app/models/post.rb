# frozen_string_literal: true

class Post < ApplicationRecord
  enum status: {
    submitted: 0,
    approved: 1,
    rejected: 2
  }

  belongs_to :user

  validates(*%i[date rationale overtime_request], presence: true)
  validates :overtime_request, numericality: true
  validates :overtime_request, numericality: { greater_than: 0.0 }

  scope :post_by, ->(user) { where(user: user) }

  after_save :update_audit_log

  private

  def update_audit_log
    audit_log = AuditLog.where(user_id: user_id, start_date: (date - 7.days)..date).last
    audit_log.confirmed!
  end
end
