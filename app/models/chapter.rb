class Chapter < ActiveRecord::Base
  belongs_to :book
  has_many :verses
  attr_accessible :link, :number
  validates :link, :uniqueness => { :case_sensitive => false }
  
  validates_presence_of :number, :link

  def as_json(options = {})
    {
      :number => self.number,
      :link => self.link
    }
  end
  
end
