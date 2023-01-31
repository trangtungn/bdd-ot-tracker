# frozen_string_literal: true

class Post < ApplicationRecord
  enum status: {
    submitted: 0,
    approved: 1,
    rejected: 2
  }

  belongs_to :user

  validates(*%i[date rationale], presence: true)

  scope :post_by, ->(user) { where(user: user) }
end
