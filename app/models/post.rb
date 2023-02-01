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
end
