class Section < ActiveRecord::Base
  has_many :pages, :dependent => :destroy
end
