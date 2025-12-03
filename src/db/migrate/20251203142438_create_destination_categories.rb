class CreateDestinationCategories < ActiveRecord::Migration[8.0]
  def change
    create_table :destination_categories do |t|
      t.references :destination, null: false, foreign_key: true
      t.references :category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
