class CreateCities < ActiveRecord::Migration[6.1]
  def change
    create_table :cities do |t|
      t.string :city_name, null: false,  comment: "都市名"
      t.integer "location_id", null: false, comment: "locationのid"

      t.timestamps
    end
  end
end
