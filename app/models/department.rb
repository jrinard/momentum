class Department < ApplicationRecord

  has_many :positions
  has_many :parts, through: :positions

  validates :name, :presence => true

  before_save :tileize_depart
  def tileize_depart
    self.name = self.name.titleize
  end

  # scope :desc, order("departments.order DESC")

end
