module JsonWebToken
  extend ActiveSupport::Concern

  SECRET_KEY = (Rails.application.credentials.secret_key_base if Rails.application.respond_to?(:credentials)) || ENV['SECRET_KEY_BASE'] || Rails.application.secret_key_base

  class << self
    def encode(payload, exp = 24.hours.from_now)
      payload[:exp] = exp.to_i
      JWT.encode(payload, SECRET_KEY)
    end

    def decode(token)
      body = JWT.decode(token, SECRET_KEY)[0]
      HashWithIndifferentAccess.new body
    rescue JWT::ExpiredSignature, JWT::VerificationError, JWT::DecodeError => e
      raise ExceptionHandler::InvalidToken, e.message
    end
  end
end
