Rails.application.routes.draw do
  get "/", to: "exchanges#index"
  get "convert", to: "exchanges#convert"
end
