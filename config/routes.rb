Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :users, only: [:index, :show, :create]
      get 'EscambiaCountyFLAlerts', to: 'nws_alerts#index'
    end
  end
end
