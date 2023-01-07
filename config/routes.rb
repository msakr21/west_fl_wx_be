Rails.application.routes.draw do
  resources :users
  namespace :api do
    namespace :v1 do
      get 'EscambiaCountyFLAlerts', to: 'nws_alerts#index'
    end
  end
end
