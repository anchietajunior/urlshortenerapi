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
        @link = Link.new link_params
        break if @link.save
      end
    end

    def shortened_url
      chars = ['0'..'9', 'A'..'Z', 'a'..'z'].map(&:to_a).flatten
      return 6.times.map { chars.sample }.join
    end

    def expires_at
      params[:expires_at].present? ? params[:expires_at].to_i.hours.from_now : 24.hours.from_now
    end

    def link_params
      {}.tap do |hash|
        hash[:user] = user
        hash[:original_url] = params[:original_url]
        hash[:shortened_url] = shortened_url
        hash[:expires_at] = expires_at
      end
    end
  end
end
