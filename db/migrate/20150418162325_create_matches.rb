class CreateMatches < ActiveRecord::Migration
  def change
    create_table :matches do |t|
      t.integer :home_goals
      t.integer :away_goals

      t.timestamps null: false
    end
  end
end
