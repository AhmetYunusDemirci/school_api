module ExceptionHandler
  extend ActiveSupport::Concern

  class AuthenticationError < StandardError; end
  class InvalidToken < StandardError; end

  included do
    rescue_from ExceptionHandler::AuthenticationError, with: :unauthorized_request
    rescue_from ExceptionHandler::InvalidToken, with: :invalid_token
  end

  private

  def unauthorized_request(exception)
    render json: { errors: exception.message }, status: :unauthorized
  end

  def invalid_token(exception)
    render json: { errors: exception.message }, status: :unauthorized
  end
end
