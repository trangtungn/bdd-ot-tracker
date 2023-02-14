# frozen_string_literal: true

module Api
  module V1
    class RoomSerializer < ActiveModel::Serializer
      attributes :id, :name, :description, :currency, :price_per_hour
    end
  end
end
