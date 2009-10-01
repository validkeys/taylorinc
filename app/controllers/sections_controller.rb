class SectionsController < ApplicationController
  resource_controller
  
  actions :index, :show #only handle index and show actions
  
  show.wants.html { redirect_to section_page_path(@section, @section.pages.first) }
  
  index.wants.xml { render  :template => "sections/index.xml" }
  show.wants.xml { render  :template => "sections/show.xml" }
  
end