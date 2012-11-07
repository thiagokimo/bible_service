class Chapter < ActiveRecord::Base
  belongs_to :book
  attr_accessible :link, :number
  validates :link, :uniqueness => { :case_sensitive => false }
  
  validates_presence_of :number, :link
end
