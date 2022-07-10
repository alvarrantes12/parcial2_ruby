Rails.application.routes.draw do

  scope module: :api do
    resources :special_contents
    resources :contents
  end

end
