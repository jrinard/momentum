class Unit < ApplicationRecord
  belongs_to :user
  has_many :parts

  validates :familyName, :presence => true

  before_save :tileize_unit
  def tileize_unit
    self.familyName = self.familyName.titleize
  end
end
