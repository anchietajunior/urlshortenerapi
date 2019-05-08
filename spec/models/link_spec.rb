require 'rails_helper'

RSpec.describe Link, type: :model do
  describe 'validations' do
    let(:link1) { build(:link) }
    let!(:link2) { create(:link, shortened_url: 'oiulkj') }
    let(:link3) { build(:link, shortened_url: 'oiulkj') }
    
    it 'is valid' do
      expect(link1.valid?).to be_truthy
    end

    it 'is not valid' do
      expect(link3.valid?).to be_falsy
    end

    it { is_expected.to validate_uniqueness_of :shortened_url }
    it { is_expected.to validate_presence_of :user }
    it { is_expected.to validate_presence_of :original_url }
    it { is_expected.to validate_presence_of :expires_at }
  end
end
