class Car < ApplicationRecord
  validates :make, :model, :price, :year, presence: true
  validates :year, numericality: {only_integer: true, greater_than: 1900, less_than_or_equal_to: Date.current.year, message: "shut the fuck up"}
end