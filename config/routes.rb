Rails.application.routes.draw do
  namespace :api, { format: "json" } do
    namespace :v1 do
      resources :allocs, only: [:index]
      resources :assigns, only: [:index]
      resources :months, only: [:index]
    end
  end

  resources :allocs, only: [:index]
  resources :assigns, only: [:index]
end
