class RemoveColumnFromChatroom < ActiveRecord::Migration[6.0]
  def change
    remove_column :chatrooms, :sport
  end
end
