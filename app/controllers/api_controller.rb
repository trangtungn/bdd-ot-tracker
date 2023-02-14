# frozen_string_literal: true

class ApiController < ActionController::API
  rescue_from ActiveRecord::RecordNotFound, with: :render_error_not_found
  rescue_from ActionController::ParameterMissing, with: :render_error_params_missing
  rescue_from ActiveRecord::RecordInvalid, with: :render_record_invalid

  def error_not_found
    render_error_not_found
  end

  protected

  def render_record_invalid(err)
    render json: { message: err.message }, status: :unprocessable_entity
  end

  def render_error_not_found
    render json: { message: 'Resource not found.' }, status: :not_found
  end

  def render_error_params_missing
    render json: { message: 'A parameter is missing or the value is empty.' }, status: :unprocessable_entity
  end
end
