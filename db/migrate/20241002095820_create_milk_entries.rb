class CreateMilkEntries < ActiveRecord::Migration[7.2]
  def change
    create_table :milk_entries do |t|
      t.decimal :quantity
      t.date :date
      t.time :time
      t.references :farmer, null: false, foreign_key: true

      t.timestamps
    end
  end
end
