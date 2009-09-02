class Admin::ProjectsController < Admin::MainController
  resource_controller
  
  actions :all, :except => :show
  
  [create, update].each { |action| 
    action.wants.js {
      flash[:notice] = nil # remove the default notice
      render :json => {:title => 'Success', :message => 'Project has been successfully saved.', :timeout => 2000}.to_json
    }
    action.failure.wants.js {
      flash[:notice] = nil # remove the default notice
      # if we get a failure, report the first error found back in a json object
      message = nil
      @object.errors.each_full{ |msg| message ||= msg } # add the first error to the message
      render :json => {:title => 'Error', :message => message, :icon => 'cross', :timeout => 6000}.to_json # send it back
    }
    action.wants.html { redirect_to edit_object_path }
  }
  
  private #-------
    # Defining the collection explicitly for paging
    def collection
      @collection ||= end_of_association_chain.paginate :page => params[:page], :per_page => 15, :order => 'title'
    end
    
end