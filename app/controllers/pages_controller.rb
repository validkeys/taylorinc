class PagesController < ApplicationController
  resource_controller
  
  belongs_to :section
  
  actions :show # only handle the show action
end