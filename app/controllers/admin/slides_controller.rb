class Admin::SlidesController < Admin::MainController
  resource_controller
  
  actions :all, :except => :show
  
  # redirect to edit path on create and update instead of show
  [create, update].each { |action| action.wants.html { redirect_to edit_object_path } }
  
  # update an individual slide's position
  def update_position
    begin
      slide = Slide.find(params[:id])
      slide.insert_at(params[:position].to_i)
      render :json => {:title => 'Success', :message => 'The slide order was moved successfuly.'}
    rescue
      render :json => {:title => 'Error', :message => 'We ran into an error updating the slide order.'}
    end
  end
  
  private #-------
    # Defining the collection explicitly for paging
    def collection
      @collection ||= end_of_association_chain.find :all, :include => 'slugs', :order => 'slides.position'
    end
end