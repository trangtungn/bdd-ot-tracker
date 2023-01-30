# frozen_string_literal: true

class User < ApplicationRecord
  has_many :posts, dependent: :destroy

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :trackable,
         :recoverable, :rememberable, :validatable

  validates :email, :first_name, :last_name, presence: true

  ADMIN_TYPES = %w[AdminUser].freeze

  def admin?
    ADMIN_TYPES.include?(type)
  end

  def full_name
    "#{last_name}, #{first_name}"
  end
end
