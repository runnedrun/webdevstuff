class Place < ActiveRecord::Base
  default_scope :order => 'rating DESC'
  has_many :comparisons, :dependent => :destroy
 
  validates :title, :description, :presence => true
  validates :title, :uniqueness => true
  validates :rating, :absolute_rank, :numericality => true
  COMPARISONS =[]
  all.each {|place| COMPARISONS << place.title}
  COMPIDS = []
  all.each {|place| COMPIDS << place.id}
end
