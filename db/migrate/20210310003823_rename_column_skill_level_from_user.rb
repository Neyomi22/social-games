class RenameColumnSkillLevelFromUser < ActiveRecord::Migration[6.0]
  def change
    rename_column :users, :skill_level, :ranking
  end
end
