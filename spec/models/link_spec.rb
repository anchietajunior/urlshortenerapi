require 'rails_helper'

RSpec.describe Link, type: :model do
  describe 'validations' do
    let!(:user) { User.create!(email: 'hello@anchietajunior.com', password: "123$%ˆ&", password_confirmation: "123$%ˆ&") }
    it 'is valid' do
      link = Link.new(original_url: 'google.com', shortened_url: 'urjlk', expires_at: 24.hours.from_now, user_id: user.id)
      expect(link.valid?).to be_truthy
    end
  end
end
