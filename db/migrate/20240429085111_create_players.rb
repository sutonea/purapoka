class CreatePlayers < ActiveRecord::Migration[7.1]
  def change
    create_table :players, id: :string do |t|
      t.references :room, null: false, foreign_key: true, type: :string
      t.timestamps
    end
  end
end
