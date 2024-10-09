class VeterinaryDoctor < ApplicationRecord
  # Validations
  validates :name, presence: true
  validates :about, presence: true, length: { maximum: 500 } # Limit length for about description
  validates :contact_number, presence: true, format: { with: /\A\d{10}\z/, message: "must be 10 digits" } # Example for a 10-digit number
  validates :location, presence: true

  # Additional methods can be added here if necessary
end
