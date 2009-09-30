class Section < ActiveRecord::Base
  has_many :pages, :dependent => :destroy, :order => 'position', :include => 'slugs'
  
  validates_presence_of :permalink
  validates_presence_of :title
  validates_length_of :title, :within => 2..100
  
  has_attached_file :image,
                    :styles => { :"1080" => "1920x1080#", :"720" => "1280x720#", :"640" => "640x360#", :small => "240x150#", :thumb => "180x113#" },
                    :default_style => :"720",
                    :path => ":rails_root/public/attachments/sections/:id/:style_:basename.:extension",
                    :url => "/attachments/sections/:id/:style_:basename.:extension"
  
  validates_attachment_content_type :image, :content_type => ['image/jpeg', 'image/gif', 'image/png', 'image/pjpeg', 'image/x-png']
  
  has_friendly_id :permalink
  
  describe_attr(
    :title => 'The title should be a short but descriptive summary.',
    :image => 'Upload an image for the section.'
  )
  
end
