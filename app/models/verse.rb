class Verse < ActiveRecord::Base
  belongs_to :chapter
  has_one :book, :through => :chapter
  attr_accessible :content, :number

  validates_presence_of :number
  validates_presence_of :content

  def as_json(options={})
  { 
  	:number => self.number,
  	:content => self.content
  }
	end
end
