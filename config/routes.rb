Rails.application.routes.draw do
  resources :links
  get '/:id', to: 'links#redirect'
  post 'login', to: 'sessions#authenticate'
end
