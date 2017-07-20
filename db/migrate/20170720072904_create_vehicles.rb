class CreateVehicles < ActiveRecord::Migration[5.1]
  def change
    create_table :vehicles do |t|
      t.integer :category
      t.string :plate
      t.integer :year
      t.string :color

      t.timestamps
    end
  end
end
