ActionController::Routing::Routes.draw do |map|
  
  map.root :controller => 'slides'
  
  map.resources :sitemap
  
  map.resources :photos
  map.resources :slides
  map.resources :locations
  map.resources :stories
  map.resources :services
  map.resources :clients
  map.resources :industries
  map.resources :categories
  map.resources :projects, :has_many => :photos
  map.resources :departments
  
  map.admin '/admin', :controller => 'admin/slides'
  
  # routes for the administration area
  map.namespace :admin do |admin|
    admin.resources :slides
    admin.resources :locations
    admin.resources :stories
    admin.resources :services
    admin.resources :clients
    admin.resources :industries
    admin.resources :categories
    admin.resources :projects, :has_many => :photos
    admin.resources :departments    
  end
  
end
