class Position < ApplicationRecord
  # Join table between department and part
  belongs_to :department
  belongs_to :part
end
