class Slide < ActiveRecord::Base
  
  acts_as_list
    
  validates_presence_of :title, :url
  validates_length_of :title, :within => 2..100
  validates_length_of :url, :within => 2..255
  
  has_attached_file :image,
                    :styles => { :"1080" => "1920x1080#", :"720" => "1280x720#", :"640" => "640x360#", :small => "240x150#", :thumb => "180x113#" },
                    :default_style => :"720",
                    :path => ":rails_root/public/attachments/slides/:id/:style_:basename.:extension",
                    :url => "/attachments/slides/:id/:style_:basename.:extension"
  
  has_attached_file :transition_image,
                    :styles => { :"1080" => "1920x1080#", :"720" => "1280x720#", :"640" => "640x360#", :small => "240x150#", :thumb => "180x113#" },
                    :default_style => :"720",
                    :path => ":rails_root/public/attachments/slides/:id/:style_transition_:basename.:extension",
                    :url => "/attachments/slides/:id/:style_transition_:basename.:extension"
  
  #validates_attachment_presence :image
  validates_attachment_content_type :image, :content_type => ['image/jpeg', 'image/gif', 'image/png', 'image/pjpeg', 'image/x-png']
  validates_attachment_content_type :transition_image, :content_type => ['image/jpeg', 'image/gif', 'image/png', 'image/pjpeg', 'image/x-png']
  
  has_friendly_id :title, :use_slug => true
  
  attr_descriptions(
    :title => 'The title should be a short but descriptive summary.',
    :url => "Paste in the URL the slide will take user's to when they click on it.",
    :tag_line => 'Give the slide a descriptive tag line that describes it with a little more detail than the title.',
    :summary => 'Summarize and describe the slide the best you can.',
    :image => 'Upload an image for the slide.',
    :transition_image => 'Upload a transition image for the slide that will appear first and then transition into the main image.'
  )
  
end
