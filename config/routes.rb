Rails.application.routes.draw do
  root "welcome#index"

  post "/", to: "welcome#create"

  namespace "api" do
    namespace "v1" do
      resources :games, only: [:show]
    end
  end
  
end
