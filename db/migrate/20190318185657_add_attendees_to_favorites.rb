class AddAttendeesToFavorites < ActiveRecord::Migration[5.2]
  def change
    add_column :favorites, :attendees, :integer
  end
end
