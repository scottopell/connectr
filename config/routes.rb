Connect::Application.routes.draw do
  resources :twilio, only: [] do
    collection do
      get :inboundsms
    end
    member do
      post :setup
      post :callservice
    end
  end
end
