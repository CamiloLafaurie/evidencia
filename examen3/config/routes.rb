Rails.application.routes.draw do
  resources :people do
    resources :document
    resources :roles
  end

  root 'people#index'
end
