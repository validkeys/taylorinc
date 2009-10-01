class PhotosController < ApplicationController
  resource_controller
  
  belongs_to :project
  
  actions :index, :show #only handle index and show actions
  
  index.wants.xml { render :xml => @collection }
  show.wants.xml { render :xml => @object }
end