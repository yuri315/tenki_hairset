class CreateAdviceMaterials < ActiveRecord::Migration[6.1]
  def change
    create_table :advice_materials do |t|
      t.string :city, null: false
      t.integer :forecast_date, null: false
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
