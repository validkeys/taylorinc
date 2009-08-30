class Admin::ClientsController < Admin::MainController
  resource_controller
  
  private #-------
    # Defining the collection explicitly for paging
    def collection
      @collection ||= end_of_association_chain.paginate :page => params[:page], :per_page => 15, :order => 'name'
    end
end