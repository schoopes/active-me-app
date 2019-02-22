class ChangeZipCodeToLocationInUsers < ActiveRecord::Migration[5.2]
  def change
    rename_column :users, :zip_code, :location
  end
end
