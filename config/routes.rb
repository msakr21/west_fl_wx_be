Rails.application.routes.draw do
  resources :users, only: [:index, :show, :create]
  namespace :api do
    namespace :v1 do
      get 'EscambiaCountyFLAlerts', to: 'nws_alerts#index'
    end
  end
end
