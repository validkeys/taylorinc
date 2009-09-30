class Category < ActiveRecord::Base
  
  has_many :projects, :order => 'title', :include => 'slugs'
  has_many :departments, :through => :projects, :uniq => true, :include => 'slugs'
  has_many :industries, :through => :projects, :uniq => true, :include => 'slugs'
  
  validates_presence_of :title
  validates_length_of :title, :within => 2..100
  
  
  has_attached_file :image,
                    :styles => { :"1080" => "1920x1080#", :"720" => "1280x720#", :"640" => "640x360#", :small => "240x150#", :thumb => "180x113#" },
                    :default_style => :"720",
                    :path => ":rails_root/public/attachments/categories/:id/:style_:basename.:extension",
                    :url => "/attachments/categories/:id/:style_:basename.:extension"
  
  validates_attachment_content_type :image, :content_type => ['image/jpeg', 'image/gif', 'image/png', 'image/pjpeg', 'image/x-png']
  
  has_friendly_id :title, :use_slug => true

  attr_descriptions(
    :title => 'The title should be a short but descriptive summary.', 
    :image => 'Upload an image for the category.'
  )
  
end
