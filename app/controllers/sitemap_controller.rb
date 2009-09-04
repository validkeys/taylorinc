class SitemapController < ApplicationController
  
  caches_page :index
  
  def index
    @slides = Slide.find :all, :order => 'position'
    @categories = Category.find :all, :order => 'position'
    @departments = Department.find :all, :order => 'position'
    @industries = Industry.find :all, :order => 'position'
    @locations = Location.find :all, :order => 'position'
    @projects = Project.find :all, :order => 'title'
    @services = Section.find 'services'
    @news = Section.find 'news'
    @about = Section.find 'about'
    @legal = Section.find 'legal'
    
    respond_to do |format|
      format.html
      format.xml { render :action => 'index.xml.builder', :layout => false }
    end
  end
  
end