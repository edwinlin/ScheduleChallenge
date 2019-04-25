Rails.application.routes.draw do
  resources :schedules, only: [:index, :create, :show, :destroy]

  post '/schedules/:schedule_id/appointments', to: 'appointments#create'
  delete '/schedules/:schedule_id/appointments/:id', to: 'appointments#destroy'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
