class Event < ApplicationRecord

  has_many :spectators
  has_many :parts, through: :spectators

  validates :name, :presence => true

  before_save :tileize_depart
  def tileize_depart
    self.name = self.name.titleize
  end

end
