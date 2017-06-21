class Event < ApplicationRecord

  # has_many :spectators
  # has_many :parts, through: :spectators

  validates :name, :presence => true

  before_save :tileize_depart
  def tileize_depart
    self.name = self.name.titleize
  end

  #simple_calendar
  def start_time
     self.date ##Where 'start' is a attribute of type 'Date' accessible through MyModel's relationship
  end

  # def starts_at
  #   object.starts_at.strftime("%m/%d/%Y %H:%M")
  # end


end
