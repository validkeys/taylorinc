class Admin::ProjectsController < Admin::MainController
  resource_controller
  
  actions :all, :except => :show
  
  # redirect to edit instead of show on create and update
  [create, update].each { |action| action.wants.html { redirect_to edit_object_path } }
  
  private #-------
    # Defining the collection explicitly for paging
    def collection
      @collection ||= end_of_association_chain.paginate :page => params[:page], :per_page => 15, :order => 'title'
    end
    
end