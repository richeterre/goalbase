class MakeUuidNonNullInPlayers < ActiveRecord::Migration
  def change
    change_column :players, :uuid, :uuid, null: false, default: 'uuid_generate_v4()'
  end
end
