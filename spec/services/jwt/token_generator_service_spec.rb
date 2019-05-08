require 'rails_helper'

RSpec.describe Jwt::TokenGeneratorService do
  let!(:user) { create(:user) }

  describe "call" do
    context "success" do
      it "has a valid token" do
        result = described_class.call(user.email, 'bebaagua2019')
        expect(result.value.split(".").length).to eq(3)
      end
    end

    context "failure" do
      it "has a invalid token" do
        result = described_class.call(user.email, '198273891728')
        expect(result.success?).to be_falsy
      end
    end
  end
end
