class AddEventToChatroom < ActiveRecord::Migration[6.0]
  def change
    add_reference :chatrooms, :event, null: false, foreign_key: true
  end
end
