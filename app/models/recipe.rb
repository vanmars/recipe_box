class Recipe < ApplicationRecord
  has_and_belongs_to_many(:tags)

  # Validation
  validates :instructions, :ingredients, :name, :rating, presence: true

  # Scopes
  scope :highest_rating, -> { order(rating: :desc)}

  scope :ingredient_search, -> (ingredients_parameter) {where("ingredients ilike ?", "%#{ingredients_parameter}%")}
end