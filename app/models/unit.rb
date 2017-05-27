class Unit < ApplicationRecord
  belongs_to :user
  has_many :parts

  validates :familyname, :presence => true

  before_save :tileize_unit
  def tileize_unit
    self.familyname = self.familyname.titleize
  end

  def self.search(search)
    where("familyName LIKE ?", "%#{search}%")
  end

end
