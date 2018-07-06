Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # %w[404 401 500 503].each do |code|
  #   get code, to: 'errors#show', code: code
  # end

  resources :contacts, only: %i[create], constraints: { format: :js }

  root 'home#index'
end
