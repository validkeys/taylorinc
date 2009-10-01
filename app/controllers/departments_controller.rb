class DepartmentsController < ApplicationController
  resource_controller
  
  actions :index, :show #only handle index and show actions
  
  show.wants.html { @departments = Department.find :all, :order => 'position'  }
  
  index.wants.xml { render  :template => "departments/index.xml" }
  show.wants.xml { render  :template => "departments/show.xml" }
  
end