class AddColumntoEvent < ActiveRecord::Migration[6.0]
  def change
    add_column :events, :skill_level, :string
  end
end
