class Helper < ActiveRecord::Base
  belongs_to :place
  has_one :comparison
end
