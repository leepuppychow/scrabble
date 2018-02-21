Rails.application.routes.draw do
  root "welcome#index"

  post "/", to: "welcome#create"
end
