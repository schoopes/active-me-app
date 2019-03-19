class RemoveAttendeesFromFavorites < ActiveRecord::Migration[5.2]
  def change
    remove_column :favorites, :attendees, :integer
  end
end
