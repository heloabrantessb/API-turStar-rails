module Authentication
  extend ActiveSupport::Concern

  included do 
    before_action :authenticate
  end

  class_methods do
    def allow_unauthenticated_access(**options)
      skip_before_action :authenticate, options
    end
  end

  def encode(payload)
    now = Time.now.to_i
    JWT.encode(
      { 
        data: { 
          id: payload.id, 
          email: payload.email
        }, 
        exp: now + 1.hours.to_i,
        iat: now,
        iss: "rails_jwt_api",
        aud: "rails_jwt_client",
        sub: "User",
        jti: SecureRandom.uuid,
        nbf: now + 1.second.to_i,
      }, 
      ENV['JWT_SECRET'], 
      "HS256", 
      { 
        typ: "JWT",
      }) 
  end

  def decode
    token = get_token
    if token.nil?
      raise JWT::DecodeError, "Missing token"
    else
      JWT.decode(token, ENV['JWT_SECRET'], true, { algorithm: 'HS256'})
    end
  end

private
  def get_token
    request.headers["Authorization"]&.split(" ")&.last
  end

  def current_user 
    decoded = decode
    user_id = decoded.first["data"]["id"]
   @current_user ||= User.find(user_id)
  end

  def authenticate
    begin
      if current_user
        current_user
      else
        render json: { error: "Unauthorized" }, status: :unauthorized
      end
    rescue JWT::ExpiredSignature
      render json: { error: "Token has expired" }, status: :unauthorized
    rescue JWT::VerificationError, JWT::DecodeError
      render json: { error: "Invalid or missing token" }, status: :unauthorized
    end
  end
end