Rails.application.routes.draw do

  get "/", to: "exchanges#index"
  
  get "convert", to: "exchanges#convert"

  get "convert-btc", to: "exchanges#convert_btc"
end
