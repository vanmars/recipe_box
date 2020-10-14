class Recipe < ApplicationRecord
  has_and_belongs_to_many(:tags)
  validates :instructions, :ingredients, :name, presence: true
end