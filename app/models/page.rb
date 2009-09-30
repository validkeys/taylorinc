class Page < ActiveRecord::Base
  
  belongs_to :section
  acts_as_list :scope => :section
  
  validates_presence_of :title, :body
  validates_length_of :title, :within => 2..100
  
  has_attached_file :image,
                    :styles => { :"1080" => "1920x1080#", :"720" => "1280x720#", :"640" => "640x360#", :small => "240x150#", :thumb => "180x113#" },
                    :default_style => :"720",
                    :path => ":rails_root/public/attachments/pages/:id/:style_:basename.:extension",
                    :url => "/attachments/pages/:id/:style_:basename.:extension"
  
  validates_attachment_content_type :image, :content_type => ['image/jpeg', 'image/gif', 'image/png', 'image/pjpeg', 'image/x-png']
  
  has_friendly_id :title, :use_slug => true
  
  describe_attr(
    :section => 'Select the section the page should appear within.',
    :title => 'The title should be a short but descriptive summary.',
    :body => 'Descriptive body text content for the page. May contain a limited amount of html markup as indicated in the editor below.',
    :image => 'Upload an image to show up within the page.'
  )
  
end
