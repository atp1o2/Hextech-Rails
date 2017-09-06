class Game < ApplicationRecord
  belongs_to :champion
  validates_presence_of :datePlayed
end
