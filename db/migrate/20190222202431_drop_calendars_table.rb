class DropCalendarsTable < ActiveRecord::Migration[5.2]
  def change
    drop_table :calendars
  end
end
