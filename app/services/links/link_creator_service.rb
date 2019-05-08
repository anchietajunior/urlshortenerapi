module Links
  class LinkCreatorService < ApplicationService
    def initialize(user, params)
      @user = user
      @params = params
    end

    def call
      create
      Result.new(true, nil, link)
    rescue StandardError => e
      Result.new(false, e.message, nil)
    end

    private

    attr_accessor :params, :user, :link

    def create
      loop do
        chars = ['0'..'9', 'A'..'Z', 'a'..'z'].map(&:to_a).flatten
        identifier = 6.times.map { chars.sample }.join      
        @link = Link.new user: user, original_url: params[:original_url], shortened_url: identifier, expires_at: expires_at
        break if @link.save
      end
    end

    def expires_at
      params[:expires_at].present? ? params[:expires_at].to_i.hours.from_now : 24.hours.from_now
    end
  end
end
