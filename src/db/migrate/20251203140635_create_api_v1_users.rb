class CreateUsers < ActiveRecord::Migration[8.0]
  def change
    create_table :api_v1_users do |t|
      t.string :name
      t.string :username
      t.string :email
      t.string :password
      t.references :role, null: false, foreign_key: true

      t.timestamps
    end
  end
end
