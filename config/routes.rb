ActionController::Routing::Routes.draw do |map|
  
  map.root :controller => 'slides'
  
  map.resources :sitemap
  
  map.resources :pages
  map.resources :sections, :has_many => :pages
  map.resources :photos
  map.resources :slides
  map.resources :locations
  map.resources :industries
  map.resources :categories
  map.resources :projects, :has_many => :photos
  map.resources :departments
  
  map.admin '/admin', :controller => 'admin/slides'
  
  # routes for the administration area
  map.namespace :admin do |admin|
    admin.resources :pages
    admin.resources :sections, :has_many => :pages
    admin.resources :slides
    admin.resources :locations
    admin.resources :industries
    admin.resources :categories
    admin.resources :projects, :has_many => :photos
    admin.resources :departments    
  end
  
end
