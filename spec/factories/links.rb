FactoryBot.define do
  factory :link do
    original_url 'https://anchietajunior.com/posts/iniciando-com-neovim'
    shortened_url 'ujrlkj'
    expires_at 24.hours.from_now 
    user
  end
end
