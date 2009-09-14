class Admin::CategoriesController < Admin::MainController
  resource_controller
  
  actions :all, :except => :show
  
  # redirect to collection path on create and update instead of show
  [create, update].each { |action| action.wants.html { redirect_to collection_path } }
  
  private #-------
    # Defining the collection explicitly for paging
    def collection
      @collection ||= end_of_association_chain.paginate :include => 'slugs', :page => params[:page], :per_page => 15, :order => 'title'
    end
end