class Admin::LocationsController < Admin::MainController
  resource_controller
  
  actions :all, :except => :show
  
  # redirect to edit path on create and update instead of show
  [create, update].each { |action| action.wants.html { redirect_to edit_object_path } }
  
  # update an individual location's position
  def update_position
    begin
      location = Location.find(params[:id])
      location.insert_at(params[:position].to_i)
      render :json => {:title => 'Success', :message => 'The location order was updated successfuly.'}
    rescue
      render :json => {:title => 'Error', :message => 'We ran into an error updating the location order.'}
    end
  end
  
  private #-------
    # Defining the collection explicitly for slugs join
    def collection
      @collection ||= end_of_association_chain.find :all, :include => 'slugs', :order => 'position'
    end
end