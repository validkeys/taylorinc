class Project < ActiveRecord::Base
  #belongs_to :client
  belongs_to :department
  has_many :industries, :through => :industries_projects
  has_many :categories, :through => :categories_projects
  has_many :photos
  
  validates_presence_of :title, :client
  validates_length_of :title, :within => 2..100
  validates_length_of :client, :within => 2..100
  
  has_attached_file :image,
                    :styles => { :original => "800x600>", :thumb => "300x300>" },
                    :path => ":rails_root/public/attachments/projects/:id/:style_:basename.:extension",
                    :url => "/attachments/projects/:id/:style_:basename.:extension"
  
  validates_attachment_presence :image
  validates_attachment_content_type :image, :content_type => ['image/jpeg', 'image/gif', 'image/png', 'image/pjpeg', 'image/x-png']
  
  # acts_as_list :scope => :department
  
  has_friendly_id :permalink
  
  # populate the permalink field for SEO friendly links
  def before_save
    self.permalink = "#{client}-#{title}".to_permalink
  end
  
end
