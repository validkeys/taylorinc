class SlidesController < ApplicationController
  resource_controller
  
  actions :index, :show #only handle index and show actions
  
  before_filter :load_prereq
  
  index.wants.html { redirect_to slide_path(Slide.find(:first, :order => 'position')) }
  index.wants.xml { render :template => "slides/index.xml" }
  show.wants.xml { render :template => "slides/show.xml" }
  
  private
  
    def load_prereq
      @departments = Department.find :all, :order => 'position'
      @slides ||= Slide.find :all, :order => 'position'
      @slide = @slides.first if @slide.blank?
    end
  
end