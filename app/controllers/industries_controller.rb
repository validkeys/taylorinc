class IndustriesController < ApplicationController
  resource_controller
  
  actions :index, :show #only handle index and show actions
  
  index.wants.xml { render  :template => "industries/index.xml" }
  show.wants.xml { render  :template => "industries/show.xml" }
end