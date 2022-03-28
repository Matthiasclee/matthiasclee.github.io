Rails.application.routes.draw do
  resources :blog_posts
  root 'static_pages#index'
end
