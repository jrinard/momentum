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
    s = search.downcase.titleize #fixing input so it always works with case
    where("familyName LIKE ?", "%#{s}%")
  end

  def self.search_people(search_people)
    sp = search_people.downcase.titleize #fixing input so it always works with case
    where("firstname LIKE ? OR lastname LIKE ?", "%#{sp}%", "%#{sp}%")
  end

  self.per_page = 10
end
  WillPaginate.per_page = 10
