class CreateCows < ActiveRecord::Migration[7.2]
  def change
    create_table :cows do |t|
      t.string :name
      t.integer :age
      t.references :farmer, null: false, foreign_key: true

      t.timestamps
    end
  end
end
