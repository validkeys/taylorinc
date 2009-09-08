class MainController < ApplicationController
  resource_controller
  
  def index
    @slides = Slide.find :all, :order => 'position'
    @departments = Department.find :all, :order => 'position'
    @legal = Section.find('legal')
    respond_to do |format|
      format.html
      format.xml { render :action => 'index.xml.builder', :layout => false }
    end
  end
  
end
