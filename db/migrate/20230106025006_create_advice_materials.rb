class CreateAdviceMaterials < ActiveRecord::Migration[6.1]
  def change
    create_table :advice_materials do |t|
      t.string :forecast_date, null: false
      t.references :user, type: :bigint, foreign_key: true
      t.references :city, type: :bigint, foreign_key: true

      t.timestamps
    end
  end
end
