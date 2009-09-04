class Section < ActiveRecord::Base
  has_many :pages, :dependent => :destroy, :order => 'position'
  
  validates_presence_of :permalink
  validates_presence_of :title
  validates_length_of :title, :within => 2..100
  
  has_attached_file :image,
                    :styles => { :original => "800x600>", :thumb => "300x300>" },
                    :path => ":rails_root/public/attachments/sections/:id/:style_:basename.:extension",
                    :url => "/attachments/sections/:id/:style_:basename.:extension"
  
  validates_attachment_content_type :image, :content_type => ['image/jpeg', 'image/gif', 'image/png', 'image/pjpeg', 'image/x-png']
  
  has_friendly_id :permalink
  
end
