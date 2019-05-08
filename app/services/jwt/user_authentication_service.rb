module Jwt
  class UserAuthenticationService < ApplicationService
    def initialize(headers)
      @token = headers['Authorization'].split(' ').last
    end

    def call
      authenticate!
    rescue StandardError => e
      Result.new(false, e.message, nil)
    end

    private

    attr_accessor :token

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
