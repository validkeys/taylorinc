ActionController::Routing::Routes.draw do |map|
  
  map.root :controller => 'slides'
  
  map.resources :sitemap
  
  map.resources :sections, :has_many => :pages
  map.resources :photos
  map.resources :slides
  map.resources :locations
  map.resources :industries, :has_many => :projects
  map.resources :categories, :has_many => :projects
  map.resources :projects, :has_many => :photos
  map.resources :departments, :has_many => :projects
  
  map.admin '/admin', :controller => 'admin/slides'
  
  # routes for the administration area
  map.namespace :admin do |admin|
    admin.resources :pages
    admin.resources :sections, :has_many => :pages
    admin.resources :slides
    admin.resources :locations
    admin.resources :industries, :has_many => :projects
    admin.resources :categories, :has_many => :projects
    admin.resources :projects, :has_many => :photos
    admin.resources :departments, :has_many => :projects
  end
  
end
