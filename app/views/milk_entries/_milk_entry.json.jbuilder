json.extract! milk_entry, :id, :quantity, :date, :time, :farmer_id, :created_at, :updated_at
json.url milk_entry_url(milk_entry, format: :json)
