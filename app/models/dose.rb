class Dose < ApplicationRecord
  belongs_to :cocktail
  belongs_to :ingredient

  validates :description, presence: true
  validates :cocktail_id, uniqueness: { scope: :ingredient_id }
  #Checks that the ingredient is only connected once with the cocktail
  #e.g. you don't want sugar to be connected 3 times to the cocktail
  #Does this validation in the doses table
end
