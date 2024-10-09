class Cow < ApplicationRecord
  belongs_to :farmer
  has_many :milk_entries, dependent: :destroy
end
