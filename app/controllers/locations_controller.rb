class LocationsController < ApplicationController
  resource_controller
  
  actions :index, :show # only handle index and show actions
  
  index.wants.html { 
    redirect_to location_path(Location.find(:first, :order => 'position'))
  }
  
  show.wants.html {
    @locations = Location.find :all, :order => 'position'
  }
  
  index.wants.xml { render  :template => "locations/index.xml" }
  show.wants.xml { render  :template => "locations/show.xml" }
  
end