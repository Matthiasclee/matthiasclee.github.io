Rails.application.routes.draw do
  devise_for :users
  resources :blog_posts
  get '/blog', to: redirect('/blog_posts')
  get '/blog_posts/:id/embed', to: 'blog_posts#embed', as: 'blog_post_embed'
  get '/about', to: 'about_pages#index', as: 'about_pages'
  resources :about_pages

  root 'static_pages#index'
end
