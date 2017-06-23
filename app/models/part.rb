class Part < ApplicationRecord
  belongs_to :unit
  validates :firstname, :presence => true


  before_save :tileize_part
  def tileize_part
    self.firstname = self.firstname.titleize
  end

  has_many :positions
  has_many :departments, through: :positions

  has_many :spectators
  has_many :events, through: :spectators

  has_many :spectators
  has_many :revents, through: :spectators

end
