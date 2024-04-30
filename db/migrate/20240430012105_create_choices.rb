class CreateChoices < ActiveRecord::Migration[7.1]
  def change
    create_table :choices do |t|
      t.integer :value
      t.references :player, null: false, foreign_key: true, type: :string

      t.timestamps
    end
  end
end
