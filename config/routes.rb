ActionController::Routing::Routes.draw do |map|

  map.root :controller => 'slides'
  
  map.resources :sitemap
  
  map.resources :slides
  map.resources :locations
  map.resources :stories
  map.resources :services
  map.resources :clients
  map.resources :industries
  map.resources :categories
  map.resources :projects
  map.resources :departments
  
  # routes for the administration area
  map.namespace :admin do |admin|
    admin.resources :slides
    admin.resources :locations
    admin.resources :stories
    admin.resources :services
    admin.resources :clients
    admin.resources :industries
    admin.resources :categories
    admin.resources :projects
    admin.resources :departments    
  end
  
end
