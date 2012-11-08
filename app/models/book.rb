class Book < ActiveRecord::Base
  has_many  :chapters
  
  validates :link, :uniqueness => { :case_sensitive => false }

  validates_presence_of :name, :link

  attr_accessible :link, :name

  def as_json(options = {})
    {
      :name => self.name
    }
  end

end
