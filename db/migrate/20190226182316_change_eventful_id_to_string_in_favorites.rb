class ChangeEventfulIdToStringInFavorites < ActiveRecord::Migration[5.2]
  def change
    change_column :favorites, :eventful_id, :string
  end
end
