module Users
  class UserCreatorService < ApplicationService
    def initialize(params)
      @params = params
    end

    def call
      Result.new(true, nil, create!)
    rescue StandardError => e
      Result.new(false, e.message, nil)
    end

    private

    attr_accessor :params, :user

    def create!
      User.create! params
    end
  end
end
