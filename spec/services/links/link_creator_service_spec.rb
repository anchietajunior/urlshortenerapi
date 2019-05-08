require 'rails_helper'

RSpec.describe Links::LinkCreatorService do
  let!(:user) { User.create!(email: 'hello@anchietajunior.com', password: '12345678', password_confirmation: '12345678') }

  let(:params) do
    {
      original_url: 'https://anchietajunior.com/posts/iniciando-com-neovim'
    }
  end

  let(:result) do
    described_class.call(user, params)
  end

  describe 'call' do
    context 'success' do
      it 'has a success true result' do
        p result
        expect(result.success?).to be_truthy
      end
    end
  end
end
