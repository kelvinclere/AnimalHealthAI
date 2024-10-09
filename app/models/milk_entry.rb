class MilkEntry < ApplicationRecord
  belongs_to :farmer
  belongs_to :cow, optional: true
end
