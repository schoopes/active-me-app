class RemoveCalendarIdFromUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :calendar_id, :integer
  end
end
