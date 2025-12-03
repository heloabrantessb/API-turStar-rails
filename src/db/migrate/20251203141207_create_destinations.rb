class CreateDestinations < ActiveRecord::Migration[8.0]
  def change
    create_table :destinations do |t|
      t.string :title
      t.text :description
      t.float :base_price
      t.string :country

      t.timestamps
    end
  end
end
