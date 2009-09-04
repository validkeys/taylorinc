class Admin::ProjectsController < Admin::MainController
  resource_controller
  
  belongs_to :category, :industry, :department
  
  actions :all, :except => :show
  
  before_filter :build_selects, :only => [:new, :edit, :create, :update]
  
  # redirect to edit path on create and update instead of show
  [create, update].each { |action| action.wants.html { redirect_to edit_object_path } }
  
  #[new_action, edit].each { |action| action.wants.html { build_selects }}
  
  private #-------
    # Defining the collection explicitly for paging
    def collection
      @collection ||= end_of_association_chain.paginate :include => 'slugs', :page => params[:page], :per_page => 15, :order => 'projects.title'
    end
    
    def build_selects
      @departments = Department.find(:all, :order => 'title').collect{|d| [d.title, d.id]}
      @categories = Category.find(:all, :order => 'title').collect{|c| [c.title, c.id]}
      @industries = Industry.find(:all, :order => 'title').collect{|i| [i.title, i.id]}
    end
    
end