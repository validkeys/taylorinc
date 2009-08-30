class Admin::PhotosController < Admin::MainController
  resource_controller
  belongs_to :project
  
  # redirect to edit instead of show on create and update
  [create, update].each { |action| action.wants.html { redirect_to edit_object_path } }
  
  # TODO - custom methods for ordering photos within a project
end