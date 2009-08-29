ActionController::Routing::Routes.draw do |map|
  map.resources :locations


  map.resources :stories
  map.resources :services
  map.resources :clients
  map.resources :industries
  map.resources :categories
  map.resources :projects
  map.resources :departments
  
end
