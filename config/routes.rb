Rails.application.routes.draw do
  root "teams#index"
  resources :teams do
    resources :matches do
      resources :play_logs, only: [:create, :destroy]
    end
  end
end
