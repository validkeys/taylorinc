ActionController::Routing::Routes.draw do |map|
  
  map.root :controller => 'slides'
  
  map.resources :main
  map.resources :sitemap, :collection => {:flash => :get }
    
  map.resources :sections, :has_many => :pages
  map.resources :photos
  map.resources :slides
  map.resources :locations
  map.resources :industries, :has_many => :projects
  map.resources :categories, :has_many => :projects
  map.resources :projects, :has_many => :photos
  map.resources :departments, :has_many => [:projects, :categories, :industries]
  
  map.logout '/logout', :controller => 'sessions', :action => 'destroy'
  map.login '/login', :controller => 'sessions', :action => 'new'
  map.resource :session
  
  # routes for the administration area
  map.admin '/admin', :controller => 'admin/main'
  map.namespace :admin do |admin|
    admin.resources :users
    admin.resources :main, :collection => { :textile_preview => :post }
    admin.resources :sections do |section|
      section.resources :pages, :member => { :update_position => :put }
    end
    admin.resources :slides, :member => { :update_position => :put }
    admin.resources :locations, :member => { :update_position => :put }
    admin.resources :industries, :has_many => :projects
    admin.resources :categories, :has_many => :projects
    admin.resources :projects do |project|
      project.resources :photos, :member => { :update_position => :put }
    end
    admin.resources :departments, :member => { :update_position => :put }, :has_many => :projects
  end
  
end
