Rails.application.routes.draw do

  get '/login',   to: 'sessions#new'
  post '/login',   to: 'sessions#create'
  get '/logout',  to: 'sessions#destroy'

  resources :surveys
  resources :buisinesses
  resources :instances
  root to: 'defaults#index'

  # HOME


  get '/home', to:'defaults#home', as: 'home'

  # REGISTER

  get 'register/candidat/(:id)' , to:'register#candidat', as: 'registercandidat'

  get 'register/admin', to:'register#admin', as: 'registeradmin'

  # USER

  resources :users

  post 'users/admin', to:'users#addadmin', as: 'usersadmin'


  # Question 
  
  get 'survey', to:'defaults#survey_candidat', as: 'surveycandidat'
  post 'sendquestion', to:'defaults#sendquestion', as: 'sendquestion'
end
