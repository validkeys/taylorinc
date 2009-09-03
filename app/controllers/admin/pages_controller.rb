class Admin::PagesController < Admin::MainController
  resource_controller
  
  belongs_to :section
  
  actions :all, :except => :show
  
  # redirect to edit path on create and update instead of show
  [create, update].each { |action| action.wants.html { redirect_to edit_object_path } }
  
  private #-------
    # Defining the collection explicitly for paging
    def collection
      @collection ||= end_of_association_chain.paginate :page => params[:page], :per_page => 15, :order => 'pages.position'
    end
end