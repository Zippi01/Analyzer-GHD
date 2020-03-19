Rails.application.routes.draw do
  # scope '(:locale)', locale: /#{I18n.available_locales.join("|")}/ do

  devise_for :users, controllers: { omniauth_callbacks: 'omniauth' }

  root 'home_pages#index'
end
