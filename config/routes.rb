Rails.application.routes.draw do
  get "/resumes", to: "resumes#index"
  get "/resumes/new", to: "resumes#new", as: "new_resume"
  post "/resumes", to: "resumes#create"
  resource :users, only: [:create] do
    get :sign_up
    get :sign_in
  end

  resources :sessions, only: [:create, :destroy]
  root "resumes#index"
  
end
