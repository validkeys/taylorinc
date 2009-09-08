class Page < ActiveRecord::Base
  
  belongs_to :section
  acts_as_list :scope => :section
  
  validates_presence_of :title, :body
  validates_length_of :title, :within => 2..100
  
  has_attached_file :image,
                    :styles => { :"1080" => "1920x1080#", :"720" => "1280x720#", :small => "240x150#", :thumb => "180x113#" },
                    :default_style => :"720",
                    :path => ":rails_root/public/attachments/pages/:id/:style_:basename.:extension",
                    :url => "/attachments/pages/:id/:style_:basename.:extension"
  
  validates_attachment_content_type :image, :content_type => ['image/jpeg', 'image/gif', 'image/png', 'image/pjpeg', 'image/x-png']
  
  has_friendly_id :title, :use_slug => true
  
end
