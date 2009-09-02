# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details

  # Scrub sensitive parameters from your log
  # filter_parameter_logging :password
  
  protected
    def correct_safari_and_ie_accept_headers
      ajax_request_types = ['text/javascript', 'application/json', 'text/xml']
      request.accepts.sort!{ |x, y| ajax_request_types.include? (y.to_s) ? 1 : -1 } if request.xhr?
    end
  
end
