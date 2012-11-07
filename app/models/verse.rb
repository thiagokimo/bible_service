class Verse < ActiveRecord::Base
  has_one :book, :through => :chapter
  attr_accessible :content, :number

  validates_presence_of :number

  def as_json(options = {})
    {
      :number => self.number,
      :content => self.content
    }
  end

end
