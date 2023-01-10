Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      post '/alert_mailer', to: 'alert_mailer#create'
    end
  end
end
