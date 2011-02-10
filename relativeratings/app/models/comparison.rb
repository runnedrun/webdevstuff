class Comparison < ActiveRecord::Base
  belongs_to :helper
  has_one :place
end
