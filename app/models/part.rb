class Part < ApplicationRecord
  belongs_to :unit
  validates :firstName, :presence => true
end
