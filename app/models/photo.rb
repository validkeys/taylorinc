class Photo < ActiveRecord::Base
  
  belongs_to :project
  acts_as_list :scope => :project
  
  validates_presence_of :project
  validates_length_of :title, :within => 5..128, :allow_nil => true, :allow_blank => true
  
  has_attached_file :image,
                    :styles => { :"1080" => "1920x1080#", :"720" => "1280x720#", :"640" => "640x360#", :small => "240x150#", :thumb => "180x113#" },
                    :default_style => :"720",
                    :path => ":rails_root/public/attachments/:id/:style_:basename.:extension",
                    :url => "/attachments/:id/:style_:basename.:extension"
                    
  validates_attachment_presence :image
  validates_attachment_content_type :image, :content_type => ['image/jpeg', 'image/gif', 'image/png', 'image/pjpeg', 'image/x-png'] 
  
  attr_descriptions(
    :title => 'The title should be a short but descriptive summary.',
    :image => 'Upload the image.'
  )
  
end
