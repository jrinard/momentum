class Part < ApplicationRecord
  belongs_to :user
  validates :firstName, :presence => true
end
