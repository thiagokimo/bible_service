class Chapter < ActiveRecord::Base
  belongs_to :book
  attr_accessible :link, :number
end
