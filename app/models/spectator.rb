class Spectator < ApplicationRecord
  # Join table between event and part
  belongs_to :event
  belongs_to :part
end
