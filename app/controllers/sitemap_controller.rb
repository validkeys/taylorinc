class SitemapController < ApplicationController
  
  caches_page :index
  
  def index
    @categories = Category.find :all, :order => 'position'
    @clients = Client.find :all, :order => 'name'
    @departments = Department.find :all, :order => 'position'
    @industries = Industry.find :all, :order => 'position'
    @locations = Location.find :all, :order => 'position'
    @projects = Project.find :all, :order => 'title'
    @services = Service.find :all, :order => 'position'
    @slides = Slide.find :all, :order => 'position'
    @stories = Story.find :all, :order => 'created_at DESC'
    
    respond_to do |format|
      format.html
      format.xml { render :action => 'index.xml.builder', :layout => false }
    end
  end
  
end