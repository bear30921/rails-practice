Rails.application.routes.draw do
  get 'bmi', to: "bmi#index"
  post "bmi/result", to: "bmi#result"


  resources :candidates do
  	member do
  		post :vote
  	end
  end






  # get "hello_world", to: "pages#hello"
  # resources :posts
  # resources :users




  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
