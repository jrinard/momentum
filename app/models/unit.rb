class Unit < ApplicationRecord
  belongs_to :user
  has_many :parts

  validates :familyname, :presence => true, :format => { :with => /\A[a-z0-9\s]+\Z/i,
    :message => "Only letters, spaces, and numbers allowed" }

  before_save :titleize_unit

  def titleize_unit
    self.familyname = self.familyname.downcase.titleize
  end

  def self.search(search)
    where("familyName LIKE ?", "%#{search}%")
  end

  def self.search_people(search_people)
    where("firstName LIKE ? OR lastName LIKE ?", "%#{search_people}%", "%#{search_people}%")
  end

  self.per_page = 10
end
  WillPaginate.per_page = 10
