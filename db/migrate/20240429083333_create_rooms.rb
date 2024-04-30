class CreateRooms < ActiveRecord::Migration[7.1]
  def change
    create_table :rooms, id: :string do |t|
      t.string :password_for_join
      t.date :expired_at

      t.timestamps
    end
    add_index :rooms, :expired_at
  end
end
