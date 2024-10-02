class Farmer < ApplicationRecord
  has_many :milk_entries, dependent: :destroy
  has_many :cows, dependent: :destroy

  accepts_nested_attributes_for :milk_entries, allow_destroy: true
  accepts_nested_attributes_for :cows, allow_destroy: true

  def total_quantity
    milk_entries.sum(:quantity)
  end
end
