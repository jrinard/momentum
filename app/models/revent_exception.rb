class ReventException < ApplicationRecord
  belongs_to :revent

  validates :time, presence: true
end
