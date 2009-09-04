ActionController::Routing::Routes.draw do |map|
  
  map.root :controller => 'main'
  
  map.resources :main
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
    admin.resources :main, :collection => { :textile_preview => :post }
    admin.resources :sections do |section|
      section.resources :pages, :member => { :update_position => :put }
    end
    admin.resources :slides, :member => { :update_position => :put }
    admin.resources :locations, :member => { :update_position => :put }
    admin.resources :industries, :has_many => :projects
    admin.resources :categories, :has_many => :projects
    admin.resources :projects, :has_many => :photos
    admin.resources :departments, :member => { :update_position => :put }, :has_many => :projects
  end
  
end
