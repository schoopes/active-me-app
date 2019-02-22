class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :password_digest
      t.integer :zip_code
      t.integer :calendar_id
      t.integer :events

      t.timestamps
    end
  end
end
