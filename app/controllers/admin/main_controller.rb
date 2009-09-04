class Admin::MainController < ApplicationController
  layout 'admin'
  
  protect_from_forgery :only => [:create, :update, :destroy] 
  
  def index
  end
  
  # this is the action we use to preview all textile content from the texareas (using markItUp)
  def textile_preview
    @data = params[:data]
    render :layout => false
  end
  
end