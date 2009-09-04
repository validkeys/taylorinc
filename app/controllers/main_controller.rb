class MainController < ApplicationController
  
  def index
    @departments = Department.find :all, :order => 'position'
    respond_to do |format|
      format.html
      format.xml { render :action => 'index.xml.builder', :layout => false }
    end
  end
  
end
