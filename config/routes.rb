Rails.application.routes.draw do
  get 'parser_sites/index'
  # scope '(:locale)', locale: /#{I18n.available_locales.join("|")}/ do

  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  root 'home_pages#index'
end
