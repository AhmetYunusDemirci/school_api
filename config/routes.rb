Rails.application.routes.draw do
  resources :departments
  resources :teachers
  resources :courses
  resources :students
  resources :enrollments

  post '/auth/login', to: 'auth#login'

  get "/hello", to: ->(env) { [200, {}, ["Hello World from Rails API!"]] }
end
