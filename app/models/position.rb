class Position < ApplicationRecord
  belongs_to :department
  belongs_to :part
end
