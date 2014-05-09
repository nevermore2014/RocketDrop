RocketDrop::Application.routes.draw do
  get "gmail/index"
  get "gmail/show"
  get "gmail/create"
  get "gmail/destrop"
  resources :gmails


  root to: "gmail#index"
end
