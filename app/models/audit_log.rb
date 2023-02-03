# frozen_string_literal: true

class AuditLog < ApplicationRecord
  belongs_to :user

  after_initialize :set_default_date

  validates(*%i[status], presence: true)

  enum status: {
    pending: 0,
    confirmed: 1
  }

  private

  def set_default_date
    self.start_date ||= Time.zone.today - 6.days
  end
end
