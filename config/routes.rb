Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  jsonapi_resources :users

  jsonapi_resources :posts do
    jsonapi_related_resources :comments
  end
  jsonapi_resources :todos do
    jsonapi_related_resources :items
  end

  namespace :api, :path => "", :constraints => {:subdomain => "api"} do
    namespace :v1 do
        jsonapi_resources :users

        jsonapi_resources :posts do
          jsonapi_related_resources :comments
        end
        jsonapi_resources :todos do
          jsonapi_related_resources :items
        end
    end
  end
end
