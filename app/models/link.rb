class Link < ApplicationRecord
  belongs_to :user

  validates :user, :original_url, :shortened_url, :expires_at, presence: true
  validates :shortened_url, uniqueness: true
end
