Rails.application.routes.draw do
  resources :champions do
    resources :games
  end
end
