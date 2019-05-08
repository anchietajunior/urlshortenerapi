require 'rails_helper'

RSpec.describe Jwt::TokenService do
  let!(:user) { create(:user) }

  describe ".encode" do
    it "Should do something" do
     token = described_class.encode({ user_id: user.id })
     expect(token.split(".").length).to eq(3)
    end
  end

  describe ".decode" do
    context "valid token" do
      it "generates user hash" do
        token = described_class.encode({ user_id: user.id })
        decode = described_class.decode(token)
        expect(decode[:user_id]).to eq(user.id)
      end
    end

    context "invalid token" do
      it "generates user hash" do
        expect(described_class.decode(1)).to be_nil
      end
    end
  end
end
