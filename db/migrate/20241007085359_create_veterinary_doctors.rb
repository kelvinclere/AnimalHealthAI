class CreateVeterinaryDoctors < ActiveRecord::Migration[7.2]
  def change
    create_table :veterinary_doctors do |t|
      t.string :name
      t.string :about
      t.string :contact_details
      t.string :location

      t.timestamps
    end
  end
end
