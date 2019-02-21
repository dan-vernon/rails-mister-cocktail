class Dose < ApplicationRecord
  belongs_to :cocktail
  belongs_to :ingredient
  validates :description, presence: true
  # validates :cocktail_id, :ingredient_id, presence: true, uniqueness: true
  validates_uniqueness_of :cocktail_id, scope: :ingredient_id
end
