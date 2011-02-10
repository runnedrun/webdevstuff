class Place < ActiveRecord::Base
  belongs_to :comparison
  has_many :helpers 
  validates :title, :description, :presence => true
  COMPARISONS =[]
  all.each {|place| COMPARISONS << place.title}
end
