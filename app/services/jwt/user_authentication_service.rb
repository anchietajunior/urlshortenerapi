module Jwt
  class UserAuthenticationService < ApplicationService
    def initialize(headers)
      @headers = headers
    end

    def call
      authenticate!
    rescue StandardError => e
      Result.new(false, e.message, nil)
    end

    private

    attr_accessor :headers, :token

    def token
      @token ||= headers['Authorization'].present? ? headers['Authorization'].split(' ').last : nil 
    end

    def user
      @user ||= User.find(decode_jwt_token)
    end

    def decode_jwt_token
      Jwt::TokenService.decode(token)["user_id"]
    end

    def authenticate!
      raise "Invalid Token!" if user.blank?
      Result.new(true, nil, user)
    end
  end
end
