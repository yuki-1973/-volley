Rails.application.routes.draw do
  root "teams#index"
  resources :teams do
    resources :matches
  end
end
