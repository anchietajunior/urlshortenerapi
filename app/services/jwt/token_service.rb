# This class is responsible for encoding
# the user_id and return a encoded hash
# Also decode the token and return a valid
# user_id
module Jwt
  class TokenService
    def self.encode(payload, expiration = 2.hours.from_now)
      payload[:exp] = expiration.to_i
      JWT.encode(payload, Devise.secret_key)
    end

    def self.decode(token)
      body = JWT.decode(token, Devise.secret_key)[0]
      HashWithIndifferentAccess.new(body)
    rescue JWT::ExpiredSignature
      nil
    rescue
      nil
    end
  end
end

