class Champion < ApplicationRecord
  has_many :games, dependent: :destroy
  validates_presence_of :name
end
