require 'rails_helper'

RSpec.describe Links::LinkCreatorService do
  let!(:user) { create(:user) }

  let(:params) do
    {
      original_url: 'https://anchietajunior.com/posts/iniciando-com-neovim'
    }
  end

  let(:params_with_date) do
    {
      original_url: 'https://anchietajunior.com/posts/iniciando-com-neovim',
      expires_at: 5
    }
  end

  let(:params_with_repeated_url) do
    {
      original_url: 'https://anchietajunior.com/posts/iniciando-com-neovim',
      shortened_url: 'kijopl'
    }
  end

  let(:result) do
    described_class.call(user, params)
  end

  let(:result2) do
    described_class.call(user, params_with_date)
  end

  let!(:result3) do
    described_class.call(user, params_with_repeated_url)
  end

  let!(:result4) do
    described_class.call(user, params_with_repeated_url)
  end

  describe 'call' do
    context 'success' do
      it 'has a success true result' do
        expect(result.success?).to be_truthy
      end

      it 'has a success true result' do
        expect(result2.value.expires_at.round).to eq 5.hours.from_now.round
      end

      it 'has a success true result when passing an identifier' do
        expect(result3.success?).to be_truthy
      end
    end

    context 'failure' do
      it 'has a false value for success?' do
        expect(result4.success?).to be_falsy
      end
    end
  end
end
