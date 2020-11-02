Rails.application.routes.draw do
  get "login" => "account#login_form"
  post "login" => "account#login"
  post "logout" => "account#logout"
  get 'account/index'

  get "account/:id/individual" => "account#individual"
  get "account/:id/edit" => "account#edit"
  post "account/:id/update" => "account#update"
  post "account/:id:update" => "account#delete"
  get "signup" => "account#new"
  post "users/create" => "account#create"
  get 'product/index' => 'product#index'
  get "product/add" => "product#add"
  get "product/:id" => "product#show"
  get "product/:id/edit" => "product#edit"
  post "product/create" => "product#create"
  post "product/:id/amend" => "product#amend"
  #get 'sample2/index'
  post "posts/:id/create" => "posts#create"
  post "posts/:id/edit" => "posts#edit"
  post "posts/:post_id/:product_id/destroy" => "posts#destroy"
  get 'posts/index'
  #get 'sample1/index'
  get 'top' => "home#top"
  get "about" => "home#about"
  #get "product/:id/introduction" => "product/introduction"

end
