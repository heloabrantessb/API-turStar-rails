class CreatePackages < ActiveRecord::Migration[8.0]
  def change
    create_table :packages do |t|
      t.string :title
      t.float :total_price

      t.timestamps
    end
  end
end
