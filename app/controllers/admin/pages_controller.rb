class Admin::PagesController < Admin::MainController
  resource_controller
  
  belongs_to :section
  
  actions :all, :except => :show
  
  # redirect to edit path on create and update instead of show
  [create, update].each { |action| action.wants.html { redirect_to edit_object_path } }
  
  # update an individual page's position
  def update_position
    begin
      section = Section.find(params[:section_id])
      page = section.pages.find(params[:id])
      page.insert_at(params[:position].to_i)
      render :json => {:title => 'Success', :message => 'The page order was moved successfuly.'}
    rescue
      render :json => {:title => 'Error', :message => 'We ran into an error updating the page position.'}
    end
  end
  
  private #-------
    # Defining the collection explicitly for slugs join
    def collection
      @collection ||= end_of_association_chain.find :all, :include => 'slugs'
    end
    
end