class CreatePackageDestinations < ActiveRecord::Migration[8.0]
  def change
    create_table :package_destinations do |t|
      t.references :package, null: false, foreign_key: true
      t.references :destination, null: false, foreign_key: true

      t.timestamps
    end
  end
end
