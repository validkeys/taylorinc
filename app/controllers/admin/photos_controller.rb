class Admin::PhotosController < Admin::MainController
  resource_controller
  belongs_to :project
  
  # TODO - custom methods for ordering photos within a project
end