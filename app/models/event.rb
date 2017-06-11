class Event < ApplicationRecord

  has_many :spectators
  has_many :parts, through: :spectators

  validates :name, :presence => true

  before_save :tileize_depart
  def tileize_depart
    self.name = self.name.titleize
  end


  # def starts_at
  #   object.starts_at.strftime("%m/%d/%Y %H:%M")
  # end

#Today for events # not working
  # def self.today
  #   where("DATE(created_at) = ?", Date.today)
  # end


end