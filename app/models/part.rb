class Part < ApplicationRecord
  belongs_to :unit
  validates :firstName, :presence => true


  before_save :tileize_part
  def tileize_part
    self.firstName = self.firstName.titleize
  end

end
