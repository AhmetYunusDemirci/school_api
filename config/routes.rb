# config/routes.rb

Rails.application.routes.draw do
  resources :departments
  resources :teachers
  resources :courses
  resources :students
  resources :enrollments

  # ✅ JWT login route — Bloğun dışında olmalı
  post '/auth/login', to: 'auth#login'

  # ✅ Basit test endpoint
  get "/hello", to: ->(env) { [200, {}, ["Hello World from Rails API!"]] }

  # ✅ CORS preflight (OPTIONS) istekleri için:
  # Bu, tarayıcıların OPTIONS isteği gönderdiğinde 200 yanıt dönmesini sağlar.
  match '*path', to: 'application#preflight', via: [:options]
end
