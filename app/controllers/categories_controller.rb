class CategoriesController < ApplicationController
  resource_controller
  
  actions :index, :show #only handle index and show actions
  
  index.wants.html {
    @projects = Project.find :all, :order => 'title'
  }
  
  index.wants.xml { render  :template => "categories/index.xml" }
  show.wants.xml { render  :template => "categories/show.xml" }
  
end