class Book < ActiveRecord::Base

  validates :link, :uniqueness => { :case_sensitive => false }

  validates_presence_of :name, :link

  attr_accessible :link, :name
end
