class Shop  < ApplicationRecord
  include PgSearch::Model

  has_and_belongs_to_many :categories
  has_and_belongs_to_many :brands

  # multisearchable against: [:name, :category, :brand]

  geocoded_by :address
  after_validation :geocode, :if => :address_changed? #same as saying "do it just before create"

end
