class Department < ActiveRecord::Base
  
  has_many :projects, :order => 'title'
  #has_many :featured_projects, :class_name => "project", :foreign_key => "department_id", :conditions => "featured = true", :order => 'title'
  has_many :categories, :through => :projects, :uniq => true
  has_many :industries, :through => :projects, :uniq => true
  
  acts_as_list
  
  validates_presence_of :title
  validates_length_of :title, :within => 2..100
  
  # acts_as_list
  has_attached_file :image,
                    :styles => { :"1080" => "1920x1080#", :"720" => "1280x720#", :small => "240x150#", :thumb => "180x113#" },
                    :default_style => :"720",
                    :path => ":rails_root/public/attachments/departments/:id/:style_:basename.:extension",
                    :url => "/attachments/departments/:id/:style_:basename.:extension"
  
  #validates_attachment_presence :image
  validates_attachment_content_type :image, :content_type => ['image/jpeg', 'image/gif', 'image/png', 'image/pjpeg', 'image/x-png']
  
  has_friendly_id :title, :use_slug => true
  
end
