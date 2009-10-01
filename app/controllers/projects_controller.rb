class ProjectsController < ApplicationController
  resource_controller
  
  belongs_to :category, :industry, :department
  
  actions :index, :show #only handle index and show actions
  
  index.wants.html {
    @categories = Category.find :all, :order => 'title'
    @industries = Industry.find :all, :order => 'title'
  }
  
  index.wants.xml { render  :template => "projects/index.xml" }
  show.wants.xml { render  :template => "projects/show.xml" }
  
  private #-------
    # Defining the collection explicitly for paging
    def collection
      @collection ||= end_of_association_chain.paginate :include => 'slugs', :page => params[:page], :per_page => 9, :order => 'projects.title'
    end  
end