module Users
  class UserCreatorService < ApplicationService
    def initialize(params)
      @params = params
    end

    def call
      create!
      Result.new(true, nil, user)
    rescue StandardError => e
      Result.new(false, e.message, nil)
    end

    private

    attr_accessor :params, :user

    def create!
      @user = User.new user_params
      @user.save!
    end

    def user_params
      {}.tap do |hash|
        hash[:email] = params[:email]
        hash[:password] = params[:password]
        hash[:password_confirmation] = params[:password_confirmation]
      end
    end
  end
end
