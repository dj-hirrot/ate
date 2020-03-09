Rails.application.routes.draw do
  namespace :admin do
    root to: 'home#index'
    resources :categories, only: [:index, :new, :create, :edit, :update, :destroy]
  end

  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }

  root to: 'static_pages#top'

  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
end
