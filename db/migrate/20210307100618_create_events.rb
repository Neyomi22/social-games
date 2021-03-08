class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.string :location
      t.datetime :starts_at
      t.string :sport
      t.integer :number_of_participants
      t.text :description
      t.string :title
      t.integer :duration
      t.string :private
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
