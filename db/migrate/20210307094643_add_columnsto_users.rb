class AddColumnstoUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :user_name, :string
    add_column :users, :skill_level, :string
    add_column :users, :player_rating, :integer
  end
end
