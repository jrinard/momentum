class Department < ApplicationRecord

  has_and_belongs_to_many :people

  validates :name, :presence => true

  before_save :tileize_depart
  def tileize_depart
    self.name = self.name.titleize
  end

end
