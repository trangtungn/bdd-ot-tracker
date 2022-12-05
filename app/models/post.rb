# frozen_string_literal: true

class Post < ApplicationRecord
  validates(*%i[date rationale], presence: true)
end
