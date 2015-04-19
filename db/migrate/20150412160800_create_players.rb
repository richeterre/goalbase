class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players, id: :uuid do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
