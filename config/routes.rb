Rails.application.routes.draw do
  resources :departments
  resources :teachers
  resources :courses
  resources :students
  resources :enrollments

  get "/hello", to: ->(env) { [200, {}, ["Hello World from Rails API!"]] }
end
