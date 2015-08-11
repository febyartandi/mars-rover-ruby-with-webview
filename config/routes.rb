Rails.application.routes.draw do
  root :to => "rovers#index"
  resources :rovers, :only => [:index] do
    collection do
      post "move"
    end
  end
end
