class AddUuidToPlayers < ActiveRecord::Migration
  def change
    add_column :players, :uuid, :uuid, default: 'uuid_generate_v4()'
  end
end
