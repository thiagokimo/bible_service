class Verse < ActiveRecord::Base
  has_one :book, :through => :chapter
  attr_accessible :content, :number
end
