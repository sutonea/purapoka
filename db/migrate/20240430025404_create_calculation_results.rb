class CreateCalculationResults < ActiveRecord::Migration[7.1]
  def change
    create_table :calculation_results do |t|
      t.references :room, null: false, foreign_key: true, type: :string
      t.float :average

      t.timestamps
    end
  end
end
