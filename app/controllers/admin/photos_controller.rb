class Admin::PhotosController < ApplicationController
  resource_controller
  belongs_to :project
  
  # TODO - custom methods for ordering photos within a project
end