Rover::Application.routes.draw do
  root :to => "panel#index"
  post "panel/move" => "panel#move"
end
