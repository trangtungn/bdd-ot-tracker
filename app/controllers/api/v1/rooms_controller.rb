# frozen_string_literal: true

module Api
  module V1
    class RoomsController < ApiController
      def index
        res = if price_params.blank?
                Room.all
              else
                raise ActionController::ParameterMissing if currency_param.blank?

                Room.where(price_per_hour: min_param..max_param)
              end

        render json: res, each_serializer: ::Api::V1::RoomSerializer, status: :ok
      end

      private

      def price_params
        params.permit(:currency, :min, :max)
      end

      def min_param
        price_params[:min].present? ? price_params[:min].to_f : nil
      end

      def max_param
        price_params[:max].present? ? price_params[:max].to_f : nil
      end

      def currency_param
        price_params[:currency]
      end
    end
  end
end
