class Unit < ApplicationRecord
  belongs_to :user
  has_many :parts

  validates :familyName, :presence => true
end
