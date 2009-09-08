class Admin::PhotosController < Admin::MainController
  resource_controller
  belongs_to :project
  
  actions :all, :except => :show
  
  # redirect to edit path on create and update instead of show
  [create, update].each { |action| action.wants.html { redirect_to edit_object_path } }
  
  # update an individual photo's position
  def update_position
    begin
      project = Project.find(params[:project_id])
      photo = project.photos.find(params[:id])
      photo.insert_at(params[:position].to_i)
      render :json => {:title => 'Success', :message => 'The photo order was updated successfuly.'}
    rescue
      render :json => {:title => 'Error', :message => 'We ran into an error updating the photo position.'}
    end
  end
  
end